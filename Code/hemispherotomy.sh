# This script registers the MNI adolescent brain to individual patients and uses the transform to then register the cuts of a hemispherotomy to individual control brains. 

#!/bin/bash

# cd into data directory
cd /media/aswinchari/DATA/ControllabilityControls/rawdata


for i in sub-*; do
    echo $i

    # set location of structural and diffusion data
    atlas_base=../sourcedata/derivatives/nipype/${i}/ses-preop/anatomical_pipeline/parcellation_stage/
    diffusion_base=$i/ses-preop/dwi/mrtrix
    hemi_base=../../SimHemispherotomy/
    output_base=/media/aswinchari/diskAshurM2/HemispherotomyOutput/${i}/
        
    # register atlas to patient space (diffusion) data
    reg_aladin -flo $hemi_base/AdolBrain_t1w.nii -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $diffusion_base/hemispherotomy/diff_space_atlas.nii.gz

    # register left hemispherotomy to patient data
    reg_resample -flo $hemi_base/temporal_pole_left.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/temporal_pole_left.nii.gz -inter 0
    reg_resample -flo $hemi_base/suprasylvian_left.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/suprasylvian_left.nii.gz -inter 0
    reg_resample -flo $hemi_base/ins_undercut_left.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/ins_undercut_left.nii.gz -inter 0
    reg_resample -flo $hemi_base/hippocampal_disconnection_left.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/hippocampal_disconnection_left.nii.gz -inter 0
    reg_resample -flo $hemi_base/callosotomy_left.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/callosotomy_left.nii.gz -inter 0
    reg_resample -flo $hemi_base/amygdala_left.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/amygdala_left.nii.gz -inter 0
    reg_resample -flo $hemi_base/frontobasal_disconnection_left.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/frontobasal_disconnection_left.nii.gz -inter 0
    reg_resample -flo $hemi_base/hippocampectomy_left.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/hippocampectomy_left.nii.gz -inter 0

 # register right hemispherotomy to patient data
    reg_resample -flo $hemi_base/temporal_pole_right.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/temporal_pole_right.nii.gz -inter 0    
    reg_resample -flo $hemi_base/suprasylvian_right.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/suprasylvian_right.nii.gz -inter 0   
    reg_resample -flo $hemi_base/ins_undercut_right.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/ins_undercut_right.nii.gz -inter 0
    reg_resample -flo $hemi_base/hippocampal_disconnection_right.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/hippocampal_disconnection_right.nii.gz -inter 0   
    reg_resample -flo $hemi_base/callosotomy_right.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/callosotomy_right.nii.gz -inter 0
    reg_resample -flo $hemi_base/amygdala_right.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/amygdala_right.nii.gz -inter 0
    reg_resample -flo $hemi_base/frontobasal_disconnection_right.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/frontobasal_disconnection_right.nii.gz -inter 0
    reg_resample -flo $hemi_base/hippocampectomy_right.nii.gz -ref $diffusion_base/diff_space_brain.nii.gz -aff $diffusion_base/atlas2diff.txt -res $output_base/hippocampectomy_right.nii.gz -inter 0


    # create edited tck files (left hemispherotomy)
    
    tckedit $diffusion_base/5M.tck -exclude $output_base/temporal_pole_left.nii.gz $output_base/tp_disconnection_left.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/suprasylvian_left.nii.gz $output_base/ss_disconnection_left.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/ins_undercut_left.nii.gz $output_base/ins_disconnection_left.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/hippocampal_disconnection_left.nii.gz $output_base/hippocampotomy_disconnection_left.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/callosotomy_left.nii.gz $output_base/cc_disconnection_left.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/amygdala_left.nii.gz $output_base/amy_disconnection_left.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/frontobasal_disconnection_left.nii.gz $output_base/fb_disconnection_left.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/hippocampectomy_left.nii.gz $output_base/hippocampectomy_left.tck
    
    tckedit $diffusion_base/5M.tck -exclude $output_base/temporal_pole_left.nii.gz -exclude $output_base/suprasylvian_left.nii.gz -exclude $output_base/ins_undercut_left.nii.gz -exclude $output_base/hippocampal_disconnection_left.nii.gz -exclude $output_base/callosotomy_left.nii.gz -exclude $output_base/amygdala_left.nii.gz -exclude $output_base/frontobasal_disconnection_left.nii.gz $output_base/hemispherotomy_hipp_discon_left.tck
    
    tckedit $diffusion_base/5M.tck -exclude $output_base/temporal_pole_left.nii.gz -exclude $output_base/suprasylvian_left.nii.gz -exclude $output_base/ins_undercut_left.nii.gz -exclude $output_base/hippocampectomy_left.nii.gz -exclude $output_base/callosotomy_left.nii.gz -exclude $output_base/amygdala_left.nii.gz -exclude $output_base/frontobasal_disconnection_left.nii.gz $output_base/hemispherotomy_hippocampectomy_left.tck

    # create edited tck files (right hemispherotomy)
    
    tckedit $diffusion_base/5M.tck -exclude $output_base/temporal_pole_right.nii.gz $output_base/tp_disconnection_right.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/suprasylvian_right.nii.gz $output_base/ss_disconnection_right.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/ins_undercut_right.nii.gz $output_base/ins_disconnection_right.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/hippocampal_disconnection_right.nii.gz $output_base/hippocampotomy_disconnection_right.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/callosotomy_right.nii.gz $output_base/cc_disconnection_right.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/amygdala_right.nii.gz $output_base/amy_disconnection_right.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/frontobasal_disconnection_right.nii.gz $output_base/fb_disconnection_right.tck
    tckedit $diffusion_base/5M.tck -exclude $output_base/hippocampectomy_right.nii.gz $output_base/hippocampectomy_right.tck
    
    tckedit $diffusion_base/5M.tck -exclude $output_base/temporal_pole_right.nii.gz -exclude $output_base/suprasylvian_right.nii.gz -exclude $output_base/ins_undercut_right.nii.gz -exclude $output_base/hippocampal_disconnection_right.nii.gz -exclude $output_base/callosotomy_right.nii.gz -exclude $output_base/amygdala_right.nii.gz -exclude $output_base/frontobasal_disconnection_right.nii.gz $output_base/hemispherotomy_hipp_discon_right.tck
    
    tckedit $diffusion_base/5M.tck -exclude $output_base/temporal_pole_right.nii.gz -exclude $output_base/suprasylvian_right.nii.gz -exclude $output_base/ins_undercut_right.nii.gz -exclude $output_base/hippocampectomy_right.nii.gz -exclude $output_base/callosotomy_right.nii.gz -exclude $output_base/amygdala_right.nii.gz -exclude $output_base/frontobasal_disconnection_right.nii.gz $output_base/hemispherotomy_hippocampectomy_right.tck
    
    #create structural connectomes (left hemispherotomy)

    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/tp_disconnection_left.tck $diffusion_base/targets.nii.gz $output_base/tp_disconnection_left.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/ss_disconnection_left.tck $diffusion_base/targets.nii.gz $output_base/ss_disconnection_left.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/ins_disconnection_left.tck $diffusion_base/targets.nii.gz $output_base/ins_disconnection_left.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/hippocampotomy_disconnection_left.tck $diffusion_base/targets.nii.gz $output_base/hippocampotomy_disconnection_left.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/cc_disconnection_left.tck $diffusion_base/targets.nii.gz $output_base/cc_disconnection_left.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/amy_disconnection_left.tck $diffusion_base/targets.nii.gz $output_base/amy_disconnection_left.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/fb_disconnection_left.tck $diffusion_base/targets.nii.gz $output_base/fb_disconnection_left.csv -force    
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/hippocampectomy_left.tck $diffusion_base/targets.nii.gz $output_base/hippocampectomy_left.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/hemispherotomy_hipp_discon_left.tck $diffusion_base/targets.nii.gz $output_base/hemispherotomy_hipp_discon_left.csv -force   
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/hemispherotomy_hippocampectomy_left.tck $diffusion_base/targets.nii.gz $output_base/hemispherotomy_hippocampectomy_left.csv -force
    

    #create structural connectomes (right hemispherotomy)

    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/tp_disconnection_right.tck $diffusion_base/targets.nii.gz $output_base/tp_disconnection_right.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/ss_disconnection_right.tck $diffusion_base/targets.nii.gz $output_base/ss_disconnection_right.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/ins_disconnection_right.tck $diffusion_base/targets.nii.gz $output_base/ins_disconnection_right.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/hippocampotomy_disconnection_right.tck $diffusion_base/targets.nii.gz $output_base/hippocampotomy_disconnection_right.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/cc_disconnection_right.tck $diffusion_base/targets.nii.gz $output_base/cc_disconnection_right.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/amy_disconnection_right.tck $diffusion_base/targets.nii.gz $output_base/amy_disconnection_right.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/fb_disconnection_right.tck $diffusion_base/targets.nii.gz $output_base/fb_disconnection_right.csv -force    
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/hippocampectomy_right.tck $diffusion_base/targets.nii.gz $output_base/hippocampectomy_right.csv -force
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/hemispherotomy_hipp_discon_right.tck $diffusion_base/targets.nii.gz $output_base/hemispherotomy_hipp_discon_right.csv -force   
    tck2connectome -symmetric -tck_weights_in $diffusion_base/5M_sift.txt $output_base/hemispherotomy_hippocampectomy_right.tck $diffusion_base/targets.nii.gz $output_base/hemispherotomy_hippocampectomy_right.csv -force
    
done
