#!/bin/bash
username=arian
date="$(date '+%Y%m%d')"
device="sagit"
buildtype="Official"
rom="RR-O-v6.1.0"
mega="yes"
rompath="~/android/rr"
outdir="~"

cd "$rompath"
cd out/target/product/"$device"
rm -rf ~/ProjectTrouble-"$device"-"$date"
mkdir ~/ProjectTrouble-"$device"-"$date"
unzip "$rom"-$date-"$device"-"$buildtype".zip -d "$outdir"/ProjectTrouble-"$device"-"$date"
cd "$outdir"/ProjectTrouble-"$device"-"$date"
rm system.new.dat.br system.patch.dat  system.transfer.list
rm -rf META-INF/ install/ system/
cp -r ~/ProjectTrouble-source/META-INF ./
zip -r ProjectTrouble-"$device"-"$date".zip ./

if [ "$mega" = "yes" ]
then
echo -e ${cya}"Uploading to mega.nz"
megaput ProjectTrouble-"$device"-"$date".zip
wait
echo -e ${grn}"Uploaded file succesfully"
fi
