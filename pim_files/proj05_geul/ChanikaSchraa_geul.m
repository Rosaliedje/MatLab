clear
load needs-cleaning.mat
load geulmap.txt

%%visualizing data
subplot(2,2,1)
imagesc(geulmap)
colorbar
subplot(2,2,2)
imagesc(needsCleaning)
colorbar

%%2-D logical array
concAboveLimit=(geulmap>350)

%%Visualizing logical array
subplot(2,2,4)
imagesc(concAboveLimit)
colorbar

%%calculating cost of cleaning all cells
TotalCost=1000+1.7031*900
TotalCleaning=TotalCost*sum(sum(concAboveLimit))

%%rounding to neares euro
round(TotalCleaning)

%%title lower right subplot
subplot(2,2,4)
title('Cost=23719578 euro; Threshold conc=350 mg/kg')

%%load priority


