clear workspace
save workspace
load 'demIceAge.txt'
load 'dem2001.txt'
subplot(2,2,1)
imagesc(demIceAge)
subplot(2,2,2)
imagesc(dem2001)
subplot(2,2,1)
title('Elevations Gargellen Valley 10,000 years BP')
subplot(2,2,2)
title('Elevation Gargellen valley 2001')
subplot(2,2,3)
elevation_difference=demIceAge-dem2001
imagesc(elevation_difference)
title('erosion 10,000 years')
