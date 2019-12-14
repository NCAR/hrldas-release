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


## Update in Dec 14 2019 
some notes for running these two versions of Noah-MP crop&irrigation:
So far these two versions of codes are used for point-scale simulation with crop and irrigation. For 2-D regional scale simulation, some additional data are needed, such as 2-D maps of irrigation fraction, planting area and planting/harvesting date, etc. 


### To run crop model with transfer crop parameter:
This version of codes include module_sf_noahmplsm.F_transferparameter and module_sf_noahmpdrv.F_transferparameter in ./phys and MPTABLE.TBL_crop_Zhe in ./run.

change the code names (backup of original codes are strongly recommended):
in phys directory:
cp module_sf_noahmplsm.F module_sf_noahmplsm.F_bk
cp module_sf_noahmpdrv.F module_sf_noahmpdrv.F_bk
cp module_sf_noahmplsm.F_transferparameter module_sf_noahmplsm.F
cp module_sf_noahmpdrv.F_transferparameter module_sf_noahmpdrv.F

in run directory
cp MPTABLE.TBL MPTABLE.TBL_bk
cp MPTABLE.TBL_crop_Zhe MPTABLE.TBL

compile and run 
in namelist, use dveg = 4 or 5 (off or on in dynamic vegetation in vegetation but no crop grid) and crop = 1 (use Noah-MP crop code in Xing's model).

### To run crop model with irr_plths_gdd_init
This version of codes include module_sf_noahmplsm.F_irr_plths_gdd_init and module_sf_noahmpdrv.F_irr_plths_gdd_init in ./phys and MPTABLE.TBL_crop_Zhe in ./run. 

change the code names (backup of original codes are strongly recommended):
in phys directory:
cp module_sf_noahmplsm.F module_sf_noahmplsm.F_bk
cp module_sf_noahmpdrv.F module_sf_noahmpdrv.F_bk
cp module_sf_noahmplsm.F_irr_plths_gdd_init module_sf_noahmplsm.F
cp module_sf_noahmpdrv.F_irr_plths_gdd_init module_sf_noahmpdrv.F

in IO_code directory:
cp module_NoahMP_hrldas_driver.F module_NoahMP_hrldas_driver.F_bk
cp module_hrldas_netcdf_io.F module_hrldas_netcdf_io.F_bk
cp module_hrldas_netcdf_io.F_irr_plths_gdd_init module_hrldas_netcdf_io.F
cp module_NoahMP_hrldas_driver.F_irr_plths_gdd_init module_NoahMP_hrldas_driver.F_irr_plths_gdd_init

in run directory
cp MPTABLE.TBL MPTABLE.TBL_bk
cp MPTABLE.TBL_crop_Zhe MPTABLE.TBL

compile and run 
in namelist, use dveg = 4 or 5 (off or on in dynamic vegetation in vegetation but no crop grid) and crop = 1 (use Noah-MP crop code in Xing's model).
in namelist, add IRRIGATION_OPTION before soil configuration option
