
stats2="/.../PROJECTS/SURGICAL_BRAIN_INJURY/TBSS/fa/stats2"

:'tbssstats="/RDSMount/PRJ-STILNeuro/PROJECTS/SURGICAL_BRAIN_INJURY/TBSS/fa/stats2/tbss_age_gender_edu_tfce_cor"
tbss_fill $tbssstats/tbss_stats_dax_fac4_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $tbssstats/tbss_stats_dax_fac4_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $tbssstats/tbss_stats_drad_fac2_tfce_corrp_tstat1.nii.gz 0.95 $stats2/mean_FA $tbssstats/tbss_stats_drad_fac2_tfce_corrp_tstat1_fill.nii.gz
tbss_fill $tbssstats/tbss_stats_drad_fac4_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $tbssstats/tbss_stats_drad_fac4_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $tbssstats/tbss_stats_kax_fac2_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $tbssstats/tbss_stats_kax_fac2_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $tbssstats/tbss_stats_kfa_fac2_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $tbssstats/tbss_stats_kfa_fac2_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $tbssstats/tbss_stats_krad_fac2_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $tbssstats/tbss_stats_krad_fac2_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $tbssstats/tbss_stats_md_fac2_tfce_corrp_tstat1.nii.gz 0.95 $stats2/mean_FA $tbssstats/tbss_stats_md_fac2_tfce_corrp_tstat1_fill.nii.gz
tbss_fill $tbssstats/tbss_stats_md_fac4_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $tbssstats/tbss_stats_md_fac4_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $tbssstats/tbss_stats_mk_fac2_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $tbssstats/tbss_stats_mk_fac2_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $tbssstats/tbss_stats_mkt_fac2_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $tbssstats/tbss_stats_mkt_fac2_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $tbssstats/tbss_stats_FA_fac2_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $tbssstats/tbss_stats_FA_fac2_tfce_corrp_tstat2_fill.nii.gz
'

allvoxstats="/RDSMount/PRJ-STILNeuro/PROJECTS/SURGICAL_BRAIN_INJURY/TBSS/fa/stats2/allvox_age_gender_edu_tfce_cor"
tbss_fill $allvoxstats/tbss_stats_dax_fac1_tfce_corrp_tstat1.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_dax_fac1_tfce_corrp_tstat1_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_drad_fac1_tfce_corrp_tstat1.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_drad_fac1_tfce_corrp_tstat1_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_drad_fac2_tfce_corrp_tstat1.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_drad_fac2_tfce_corrp_tstat1_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_drad_fac4_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_drad_fac4_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_kax_fac2_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_kax_fac2_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_kax_fac5_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_kax_fac5_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_kfa_fac4_tfce_corrp_tstat1.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_kfa_fac4_tfce_corrp_tstat1_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_krad_fac2_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_krad_fac2_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_md_fac1_tfce_corrp_tstat1.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_md_fac1_tfce_corrp_tstat1_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_md_fac2_tfce_corrp_tstat1.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_md_fac2_tfce_corrp_tstat1_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_md_fac4_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_md_fac4_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_mk_fac2_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_mk_fac2_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_mk_fac5_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_mk_fac5_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_mkt_fac2_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_mkt_fac2_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_mkt_fac5_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_mkt_fac5_tfce_corrp_tstat2_fill.nii.gz
tbss_fill $allvoxstats/tbss_stats_FA_fac2_tfce_corrp_tstat2.nii.gz 0.95 $stats2/mean_FA $allvoxstats/tbss_stats_FA_fac2_tfce_corrp_tstat2_fill.nii.gz





