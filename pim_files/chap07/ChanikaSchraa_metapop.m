%% Metapopulation modelling framework for Programming in MATLAB
% Chanika Schraa 2016  

%for-loops

% Initialisation
% Make sure we start from a clean environment
clear
close all
clc

% Model parameters
PCol = 0.1;
PEx = 0.2;

% Initial situation; 0/False is absent, 1/True is present
Occupancy(1) = 0;

% Calculations
Occupancy(1)=0 

% Occupancy (i+1) omdat de loop anders blijft lopen met de zelfde waarde
% voor (i). Occupancy (i)==0!! ~Ex is het omgekeerde van execute
for i=[1:1000];
    if  Occupancy(i)==0
            Col = rand(1,1) < PCol;
            Occupancy(i+1)=Col;
    else
            Ex = rand(1,1) < PEx;
            Occupancy(i+1)=~Ex;
    end
end

%Calculate mean of occupancy
mean(Occupancy)

%% While-loops generate with Code Sample 4 page 40

% Finding a value in a vector for Programming in MATLAB
% Chanika Schraa, 10756108

% Initialisation
% Make sure we start from a clean environment
clear
close all
clc

% Model parameters
BirdCounts = [1, 13, 5, 9, 17, 20, 23, 6, 3, 18, 15];
Count = 17;

% Calculations
% Find a day on which Count birds were counted
Day=1;
while BirdCounts(Day)==Count;
            Day=(Day+1);
end

% Output and visualisation
disp (['Found count ', num2str(Count), ' at day ', num2str(Day)]) 


% Output and visualisation
% Save the results to disk, save figures, and so on