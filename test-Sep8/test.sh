#!/bin/sh
# Reg=-R68/100/6/50
Reg=-RIN
Pro=-Ju0.5
ps=test.ps

gmt gmtset --MAP_FRAME_TYPE=fancy

CPT=~/22EX10033/12aug/relief.cpt
CPT1=oo.cpt
GRD=~/Desktop/topo30.grd
gmt grdcut $GRD $Reg -Gtmp1.grd -V

gmt grdsample tmp1.grd -Gtmp.grd -I2m -r -nc+c -V

#gmt grdmath -25 tmp1.grd MAX=tmp2.grd

gmt grdgradient tmp.grd -A315 -Ggradient.grd -Nt -V

gmt grdimage $Reg $Pro tmp.grd -C$CPT -Igradient.grd -K > $ps
#
gmt pscoast $Reg $Pro -Df -W0.5p,black,dashed -B5g5 -Na/1p,black -I1/0.3p,blue -O -K >> $ps

echo "80 25" | gmt psxy $Reg $Pro -Si0.08i -Gred -W3p,red -O -K >> $ps
#
# echo "78.17 23.73" | gmt psxy $Reg $Pro -Sc1p -Gblue -W3,blue -O -K >> $ps
#
# echo "78.77 24.22" | gmt psxy $Reg $Pro -Sc1p -Gblue -W3,blue -O -K >> $ps
#
# echo "88.13 27.45" | gmt psxy $Reg $Pro -Sc5p -Gblue -W3,blue -O >> $ps

cat location.dat | awk '{print $2, $1}' | gmt psxy $Reg $Pro -Sc0.08i -Gblue -W3p,blue -O -K >> $ps

cat location.dat | awk '{print $2, $1, $3}' | gmt pstext $Reg $Pro -F+f15p,black -K -O >> $ps

okular $ps
