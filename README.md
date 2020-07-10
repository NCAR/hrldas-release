# HRLDAS branch for processing GLDAS forcing data in netCDF format

In GLDAS v2.1, data format has changed from grib to netcdf. Older version of HRLDAS could only processes grib forcing. 
This branch of hrldas allows processes GLDAS forcing in netcdf format. 

Modifications include:

pre-processing codes for gldas netcdf in /HRLDAS_forcing/run/example/GLDAS (similar to Mike's version)

/HRLDAS_forcing/create_forcing.F 

details about these changes can be found in /docs/README.GLDAS
Zhe Zhang

2020-07-10
