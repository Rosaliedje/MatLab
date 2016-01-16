% % Program to experiment with debugger
% % Programming in Matlab course
% % Date            : 30-Sep-2003
% % Authors         : P.Kraal & W.Bouten, UvA
% % Matlab-version  : 6.5 R13

clear
close all
clc

%%%%%%%%%%%%%%%%%% INITIALIZATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PStart = rand(5,3);                   % Create random 2D array

%%%%%%%%%%%%%%%%%% CALCULATIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PStart3 = interp2(PStart,3,'cubic');  % Interpolate values 3 times to make it 
                                      % a larger array
PNew = 000_pfilt(PStart3);            % Use function pfilt to filter values 
                                      % of p
PDiff = PStart3 - PNew;               % Calculate changes per position

%%%%%%%%%%%%%%%%%% OUTPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)                           % Display original array
subplot(2,1,1)
imagesc(PStart3,[0,1])
title('Images of original dataset PStart')
colorbar

subplot(2,1,2)
surf(PStart3)
axis([0,20,0,35,0,1])
view(-70,65)
shading interp

figure(2)                           % Display new filtered array
subplot(2,1,1)
imagesc(PNew,[0,1])
title('Images of filtered dataset PNew')
colorbar

subplot(2,1,2)
surf(PNew)
axis([0,20,0,35,0,1])
view(-70,65)
shading interp

figure(3)                           % Display changes per position
imagesc(PDiff, [0,1])
title('Differences between original and filtered dataset (PDiff)')
colorbar