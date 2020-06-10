#/bin/sh
sed -E -e's%/opt/local%/usr%g' -e'/COMPILERF90/s%(=\s+).*%\1gfortran%' -e'/CPP\s/s%(=\s+).*%\1cpp%' -e'/CC\s/s%(=\s+).*%\1gcc%' -e's/-fno-underscoring//' arch/user_build_options.gfortran.serial > ./user_build_options

make clean all
