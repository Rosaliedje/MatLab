function [MaxM,MinM,MeanM] = statsm(M)
% % keywords: statistics, maximum, minimum, mean 
% % [MaxM, MinM, MeanM] = statsm(M);
% % This function calculates some statistics of a 2D matrix M
% % input     M       2D numeric array
% % output    MaxM    maximum of all values in M
% %           MinM    minimum of all values in M
% %           MeanM   mean of all values in M
% % example for Programming in MATLAB
% % W.Bouten, UvA, dec 2003
% % MATLAB 6.5 Release 13
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate all statistics
MaxM = max(max(M));
MinM = min(min(M));
MeanM = mean(M(:));
