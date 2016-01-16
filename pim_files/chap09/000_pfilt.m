function Out01 = pfilt(In01)
%% 	This function filters datasets based on deviation from mean
%%  Input           In01      Input dataset                2-D numeric array                     
%%  Output          Out01     Filtered output dataset      2-D numeric array
%%  Authors         : P.Kraal
%%  Date            : 30-Sep-2003
%% 	Matlab version  : 6.5 R13
%%

% Determine number of rows and columns of In01 (p)
[NRows,NCols] = size(In01);

% Declare (local) variables, Mincrit and Maxcrit are the minimum and
% maximum value acceptable for the filered dataset
% To calculate MinCrit and MaxCrit, In01 has to be transformed to a column vector (:),
% otherwise calculations are performed per column.

MinCrit  = mean(In01) - std(In01(:));
MaxCrit  = mean(In01) + std(In01(:));

% For all positions in In01 (NRows*NCols), determine if value exceeds (mean + std) 
% or (mean - std). If so, replace the value with (mean + std) or
% (mean - std). Values that do not exceed criterions are left untouched. 
% Calculation uses indexes of positions.
% For information on for-end and if-elseif-end statements, see chapter 8: Flow control

for i = 1:NRows*NCols
    if In01(i) < MinCrit
        In01(i) = MinCrit;
    elseif In01(i) > MaxCrit
        In01(i) = MaxCrit;
    end
end

% Define filtered array as output argument Out01
In01 = Out01;
