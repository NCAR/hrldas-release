# Transfer crop-specific photosynthetic parameters

In the release version (last access Feb 2020), photosynthetic for crop are generic, i.e. they don't distinguish corn (C4) and soybean (C3). In this branch, a version of crop-specific photosynthetic parameters are incorporated in three changed files, including:

./phys/module_sf_noahmplsm.F

./phys/module_sf_noahmpdrv.F

./run/MPTABLE.TBL

The incorporated version should apply different parameters for corn and soybean based on the crop type of model grid cells in regional agriculture study.

Zhe Zhang

2020-02-05
