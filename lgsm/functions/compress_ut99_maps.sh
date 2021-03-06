#!/bin/bash
# LGSM compress_ut99_maps.sh function
# Author: Daniel Gibbs
# Website: https://gameservermanagers.com
lgsm_version="210516"

function_selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))"

check.sh
clear
echo "${gamename} Map Compressor"
echo "================================="
echo "Will compress all maps in:"
echo ""
pwd
echo ""
echo "Compressed maps saved to:"
echo ""
echo "${compressedmapsdir}"
echo ""
while true; do
	read -e -i "y" -p "Start compression [Y/n]" yn
	case $yn in
	[Yy]* ) break;;
	[Nn]* ) echo Exiting; return;;
	* ) echo "Please answer yes or no.";;
	esac
done
mkdir -pv "${compressedmapsdir}" > /dev/null 2>&1
rm -rfv "${filesdir}/Maps/"*.unr.uz
cd "${systemdir}"
for map in "${filesdir}/Maps/"*; do
	./ucc-bin compress "${map}" --nohomedir
done
mv -fv "${filesdir}/Maps/"*.unr.uz "${compressedmapsdir}"
