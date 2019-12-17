root="/.../PROJECTS/SURGICAL_BRAIN_INJURY"
IDList="ids2_kk"
IDs=$(<$IDList)

# make group response for test and retest

#mkdir $root/avg_resp
#for id in $IDs
#do
#	cp /.../STIL_DATA/$id/000_data_archive/007_MRtrix_Processed_Data/output_140B/wm.txt $root/avg_resp/wm_${id}.txt
#	cp /.../STIL_DATA/$id/000_data_archive/007_MRtrix_Processed_Data/output_140B/gm.txt $root/avg_resp/gm_${id}.txt
#	cp /.../STIL_DATA/$id/000_data_archive/007_MRtrix_Processed_Data/output_140B/csf.txt $root/avg_resp/csf_${id}.txt
#done
#average_response $root/avg_resp/wm_* $root/avg_resp/wm_average.txt
#average_response $root/avg_resp/gm_* $root/avg_resp/gm_average.txt
#average_response $root/avg_resp/csf_* $root/avg_resp/csf_average.txt

for stil_id in $IDs
do
	echo $stil_id
	mrtrix_dir="/.../$stil_id/000_data_archive/007_MRtrix_Processed_Data/output_140B"
	fs_dir="/.../STIL_DATA/$stil_id/000_data_archive/006_freesurfer_data/$stil_id/mri"
	subject_archive="/.../STIL_DATA/$stil_id/000_data_archive"
	subject_project="$subject_archive/335_SBI_connectome"
	mrtrix_fs_labels="/opt/mrtrix/mrtrix3/share/mrtrix3/labelconvert/fs_a2009s.txt"
	mkdir -p "$subject_project"
	export SUBJECTS_DIR="/.../STIL_DATA/$stil_id/000_data_archive/006_freesurfer_data"

	# make fods for all using avg resps
	dwi2fod msmt_csd $subject_archive/007_MRtrix_Processed_Data/output_140B/dwinii2mif.mif $root/avg_resp/wm_average.txt $subject_project/wmfod.mif $root/avg_resp/gm_average.txt $subject_project/gmfod.mif $root/avg_resp/csf_average.txt $subject_project/csffod.mif -force -mask $subject_archive/007_MRtrix_Processed_Data/output_140B/nodif_eddy_brain_mask.nii.gz

	# mtnormalise all fods
	mtnormalise $subject_project/wmfod.mif $subject_project/wmfod_norm.mif $subject_project/gmfod.mif $subject_project/gmfod_norm.mif $subject_project/csffod.mif $subject_project/csffod_norm.mif -mask $subject_archive/007_MRtrix_Processed_Data/output_140B/nodif_eddy_brain_mask.nii.gz -force

	# wb tracktography
	tckgen $subject_project/wmfod.mif -select 10000000 -seed_image $subject_archive/007_MRtrix_Processed_Data/output_140B/nodif_eddy_brain_mask.nii.gz $subject_project/wholebrain10mil.tck -force -maxlength 300
	
	# sift2
	tcksift2 $subject_project/wholebrain10mil.tck $subject_project/wmfod.mif $subject_project/sift2_weights.txt -proc_mask $subject_archive/007_MRtrix_Processed_Data/output_140B/mask.mif -force

	# register freesurfer brain to diffusion b0
	bbregister --s $stil_id --mov $mrtrix_dir/nodif_eddy_brain.nii.gz --init-fsl --dti --reg $subject_project/reg_FS2nodif.dat

	# apply to atlas
	mri_vol2vol --targ $fs_dir/aparc.a2009s+aseg.mgz --mov $mrtrix_dir/nodif_eddy_brain.nii.gz --inv --interp nearest --no-save-reg --reg $subject_project/reg_FS2nodif.dat --o $subject_project/aseg2nodif.mgz
		    
	# convert fs labels to mrtrix nodes
	labelconvert $subject_project/aseg2nodif.mgz $FREESURFER_HOME/FreeSurferColorLUT.txt $mrtrix_fs_labels $subject_project/i_nodes.mif -force
		    
	# build connectomes
	tck2connectome $subject_project/wholebrain10mil.tck $subject_project/i_nodes.mif $subject_project/${stil_id}_connectome.csv -force -symmetric -zero_diagonal -assignment_radial_search 50 -scale_invnodevol -tck_weights_in $subject_project/sift2_weights.txt
		     
done

