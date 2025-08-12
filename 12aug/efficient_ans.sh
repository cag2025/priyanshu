#!/bin/sh

# Set GMT font parameters
gmt gmtset FONT_ANNOT_PRIMARY Times-Roman
gmt gmtset FONT_LABEL Times-Roman

# Define map variables
Reg=-R68/100/6/50
Pro=-Jm0.5
GRD=~/Desktop/topo30.grd
CPT=relief.cpt
ps=answer.ps

# Prepare the data grids
gmt grdcut $GRD $Reg -Gtmp1.grd -V
gmt grdsample tmp1.grd -Gtmp.grd -I4m -r -nc+c -V
gmt grdgradient tmp.grd -A315 -Ggradient.grd -Nt -V

# Create the map
gmt pscoast $Reg $Pro -Bf2g2 -Slightblue -K > $ps

# Plot the gridded image on top of the base map
# This line is commented out to remove the color palette and grid.
# gmt grdimage tmp.grd $Reg $Pro -C$CPT -Igradient.grd -O -K >> $ps

# Plot coastlines and rivers
gmt pscoast $Reg $Pro -Q -W0.25p,black -Ia/0.5,blue -O -K >> $ps

# Plot the station as a larger filled red inverted triangle
echo "85.99 27.34" | gmt psxy $Reg $Pro -Si0.3i -Gred -W0.5p,black -O -K >> $ps

# Plot the locations from location.dat as larger blue plus signs
awk '{print $2, $1}' location.dat | gmt psxy $Reg $Pro -S+0.3i -Gblue -Wthin -O >> $ps
