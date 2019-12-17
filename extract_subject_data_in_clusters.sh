stats2="/.../PROJECTS/SURGICAL_BRAIN_INJURY/TBSS/fa/stats2"
tbssstats="$stats2/tbss_age_gender_edu_tfce_cor"

thresh=0.99
:'
for output_file in `ls $tbssstats/*_corrp_tstat1.nii.gz; ls $tbssstats/*_corrp_tstat2.nii.gz`
do
	if (( $(echo "`mrstats $output_file -output max` >= ${thresh}" |bc -l) )); then
		# binarise clusters
		mrcalc $output_file ${thresh} -ge ${output_file}_thresh${thresh}.nii.gz -force
	fi
done

# get mean value in significant clusters
for output_file in `ls $tbssstats/*${thresh}.nii.gz | xargs -n 1 basename`
do
	# get metric name from cluster file name
	clustername=$output_file
	IFS=_; read -a clusterfields <<<"$clustername"; IFS=\;
	metric=${clusterfields[2]}
	echo $metric
	
	# get subject data
	fslmeants -i $stats2/all_${metric}.nii.gz -m $tbssstats/${output_file} -o $tbssstats/${output_file}_info.txt #cdcp
	fslmeants -i /.../PROJECTS/SURGICAL_BRAIN_INJURY/HCP/all_${metric}.nii.gz -m $tbssstats/${output_file} -o $tbssstats/${output_file}_info_HCP.txt #hcp
done
'
# get value at local maxima in significant clusters
for output_file in `ls $tbssstats/*${thresh}.nii.gz | xargs -n 1 basename`
do
	# get metric name from cluster file name
	clustername=$output_file
	IFS=_; read -a clusterfields <<<"$clustername"; IFS=\;
	metric=${clusterfields[2]}
	tstat=${clusterfields[6]}
	fac=${clusterfields[3]}
	echo $metric $fac $tstat
	
	# muliply significant clusters by tstat
	mrcalc $tbssstats/${output_file} $tbssstats/tbss_stats_${metric}_${fac}_${tstat} -mul $tbssstats/${output_file}_mul-tstat.nii.gz -force
	
	# get tstat maxima inside signifcant clusters and save as image
	mrthreshold $tbssstats/${output_file}_mul-tstat.nii.gz -toppercent 5 -ignorezero $tbssstats/${output_file}_mul-tstat_peak.nii.gz -force
	
	# get subject data
	fslmeants -i $stats2/all_${metric}.nii.gz -m $tbssstats/${output_file}_mul-tstat_peak.nii.gz -o $tbssstats/${output_file}_peak-info.txt #cdcp
	fslmeants -i /.../PROJECTS/SURGICAL_BRAIN_INJURY/HCP/all_${metric}.nii.gz -m $tbssstats/${output_file}_mul-tstat_peak.nii.gz -o $tbssstats/${output_file}_peak-info_HCP.txt #hcp
done













