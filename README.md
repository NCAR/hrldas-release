# HRLDAS-crop-irr

HRLDAS (High Resolution Land Data Assimilation System) containing the Noah-MP Land Surface Model

Much appreciated this work is mostly coded by Xiaoyu, based on an older version of hrldas 
Merged and tested and uploaded by Zhe Zhang, 2019-05-16
Thanks Mike and Fei's suggestions on transferring parameters and irrigation schemes.

Repository branch structure (as of July 27, 2018) (which is based on)

This modification is named HRLDAS-crop-irr, which includes 3 parts:
1. transferparameter -> in lsm.F and drv.F, create crop-specific PSN-stomata parameter data structure 
2. Kp -> modify Kp formula in the stomata subroutine, increasing 4000 to 20000 (Sellers 1996 and Bonan 2011)
3. irr_plths_gdd_init 
3.1 in lsm.F -> create irrigation parameter table;
3.2 in drv.F -> write Xiaoyu's 4-crop repetition irrigation in a do loop
3.3 in drv.F -> read planting/harvesting date from 18-level AGRICULTURE variable
3.4 in drv.F -> generalize season_gdd for soybean by 2000.
3.5 in drv.F -> change crop leaf and stem initial value to 0.05
3.6 in hrldas_netcdf_io.F & NoahMP_hrldas_driver.F -> define crop dimension; read agriculture variable; 
3.7 in NoahMP_hrldas_driver.F -> add BTRAN to output; add PGS, ACUIRRAMT to restart
