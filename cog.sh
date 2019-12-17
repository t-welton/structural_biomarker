#!/bin/bash
mni_brain="/usr/share/fsl/data/standard/MNI152_T1_2mm_brain.nii.gz"
root="/.../PROJECTS/SURGICAL_BRAIN_INJURY"
nodes="$root/nodes_out.nii.gz"
outfile="$root/cogs2.node"
roi_dir="$root/rois"

echo "#x y z colour size name" >> $outfile #write headers

for roi_no in {1..164}
do
	echo -n $roi_no
	fslmaths $nodes -thr $roi_no -uthr $roi_no $roi_dir/${roi_no}.nii.gz
	flirt -in $roi_dir/${roi_no}.nii.gz -applyxfm -init $root/STI68100038_brain_regmni.mat -out $roi_dir/${roi_no}_mni.nii.gz -ref $mni_brain
	fslmaths $roi_dir/${roi_no}_mni.nii.gz -ero -bin $roi_dir/${roi_no}_mni_ero_bin.nii.gz
	echo -n `fslstats $roi_dir/${roi_no}_mni_ero_bin.nii.gz -c` " 4 1 name" >> $outfile
	echo "" >> $outfile # move to next line
done

