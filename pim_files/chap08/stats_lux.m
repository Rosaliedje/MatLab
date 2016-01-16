% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %  % % % % % 
% % This programme calculates some statistics of the study area Luxemburg
% % as a demonstration of the use of the function 'statsm'
% % W. Bouten, UvA, Dec 2003
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %  % % % % % 

clear
close all
clc

% load the data
load('DemLux.txt')

% call the function and display the results in numbers and graphics
[MaxLux,MinLux,MeanLux] = statsm(DemLux)
imagesc(DemLux)
colorbar
title('Height above sea level [m]')