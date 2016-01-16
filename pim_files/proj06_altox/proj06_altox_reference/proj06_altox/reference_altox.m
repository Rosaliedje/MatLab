% Aluminium concentration - reference solution
% Lourens Veen - 2015
% Matlab 2010b

% Note: this script follows the ordering described in Chapter 6.1,
% so all the visualisation is at the bottom.


% Initialisation
% Make sure we start from a clean environment
clear
close all
clc

% Load the data
AlConc = load('al_conc.txt');


% Process the data
AlConcIsZero = (AlConc == 0);
AlConcIsNan = isnan(AlConc);

AlConcIsBroken = AlConcIsZero | AlConcIsNan;
BrokenLocs = find(AlConcIsBroken);


AlConcFilled = AlConc;

% The first broken value is at index 21. To fix it:
LeftNeighbourLoc = 20;
RightNeighbourLoc = 22;
LeftNeighbourVal = AlConcFilled(LeftNeighbourLoc);
RightNeighbourVal = AlConcFilled(RightNeighbourLoc);
NewVal21 = mean([LeftNeighbourVal, RightNeighbourVal]);
AlConcFilled(21) = NewVal21;


% We can make this more generic, by putting the location to be fixed
% in a variable instead of doing some of the calculations ourselves
% and putting the resulting numbers directly in the script. Compare
% to the above version. If you change the value of BrokenLoc to 33,
% then this will fix up the broken value at location 33, without
% changing anything else.

% Reset AlConcFilled first
AlConcFilled = AlConc;

BrokenLoc = 21;
LeftNeighbourLoc = BrokenLoc - 1;
RightNeighbourLoc = BrokenLoc + 1;
LeftNeighbourVal = AlConcFilled(LeftNeighbourLoc);
RightNeighbourVal = AlConcFilled(RightNeighbourLoc);
NewVal = mean([LeftNeighbourVal, RightNeighbourVal]);
AlConcFilled(BrokenLoc) = NewVal;


% Now, if we had a way to repeat the above code with a different
% value for BrokenLoc every time, we could repair all the broken
% values with a single set of commands. Fortunately, we do: that
% is a for-loop.

% Reset AlConcFilled again
AlConcFilled = AlConc;

for BrokenLoc = BrokenLocs
    LeftNeighbourLoc = BrokenLoc - 1;
    RightNeighbourLoc = BrokenLoc + 1;
    LeftNeighbourVal = AlConcFilled(LeftNeighbourLoc);
    RightNeighbourVal = AlConcFilled(RightNeighbourLoc);
    NewVal = mean([LeftNeighbourVal, RightNeighbourVal]);
    AlConcFilled(BrokenLoc) = NewVal;
end


% Here is a slightly different way of doing the same thing. This
% is more similar to the moving average solution below, so browse
% back to it and compare when you get there.

AlConcFilled = AlConc;

for BrokenLoc = BrokenLocs
    LeftNeighbourLoc = BrokenLoc - 1;
    RightNeighbourLoc = BrokenLoc + 1;
    NeighbourLocs = [LeftNeighbourLoc, RightNeighbourLoc];
    NeighbourVals = AlConcFilled(NeighbourLocs);
    NewVal = mean(NeighbourVals);
    AlConcFilled(BrokenLoc) = NewVal;
end



% This particular problem can also be solved without a loop,
% by doing the calculations in a vectorised way. It looks
% much the same, but the variables are now all vectors instead
% of scalars (look at the plural variable names): we
% are now doing all broken values at the same time. Also,
% compare the calls to the function mean, what's the difference?

AlConcFilled = AlConc;

LeftNeighbourLocs = BrokenLocs - 1;
RightNeighbourLocs = BrokenLocs + 1;
LeftNeighbourVals = AlConcFilled(LeftNeighbourLocs);
RightNeighbourVals = AlConcFilled(RightNeighbourLocs);
NewVals = mean([LeftNeighbourVals; RightNeighbourVals]);
AlConcFilled(BrokenLocs) = NewVals;


% If you have two consecutive broken values, then this method
% wil not work. A possible solution could be to fill each gap
% with the mean of the neighbouring correct values.


% Now, we want to calculate a 9-term moving average of AlConcFilled.
% To do this, we need a for-loop that runs not through the broken
% locations (which have been fixed), but through all the locations
% that we can calculate a 9-term moving average for.

AllLocs = 5:(length(AlConcFilled) - 4);
for Loc = AllLocs
    LeftmostLoc = Loc - 4;
    RightmostLoc = Loc + 4;
    MALocs = LeftmostLoc:RightmostLoc;
    MAVals = AlConcFilled(MALocs);
    AlConcMA9(Loc) = mean(MAVals);
end


% Check whether AlConcMA9 structurally over- or underestimates
% the concentration.
Deviation = mean(AlConcMA9) - mean(AlConcFilled)

% Deviation is -0.5264, so we are underestimating

% Will we over- or underestimate the period in a year in which
% toxic levels are reached, if we use AlConcMA9?

AlConcIsToxic = AlConcFilled > 70;
NumToxicDays = sum(AlConcIsToxic);
AlConcIsToxicMA9 = AlConcMA9 > 70;
NumToxicDaysMA9 = sum(AlConcIsToxicMA9);

DeviationDays = NumToxicDaysMA9 - NumToxicDays

% DeviationDays is -21, so we are underestimating


% Now, we want to be able to adjust the width of the moving average.
% All the numbers in the calculation above that depend on the width,
% will have to be calculated by Matlab now, based on this width.
%
% A good way to make such changes is to set the MAWidth variable to
% 9 (i.e. the value that you're using already), then make the changes
% one by one, and test in between if it's still working correctly.
% Then if you make a mistake, you will know that it's caused by the
% last change.

MAWidth = 15;

MAHalfWidth = (MAWidth - 1) / 2;

FirstLoc = MAHalfWidth + 1;
LastLoc = length(AlConcFilled) - MAHalfWidth;
AllLocs = FirstLoc:LastLoc;

for Loc = AllLocs
    LeftmostLoc = Loc - MAHalfWidth;
    RightmostLoc = Loc + MAHalfWidth;
    MALocs = LeftmostLoc:RightmostLoc;
    MAVals = AlConcFilled(MALocs);
    AlConcMA(Loc) = mean(MAVals);
end

% One last nicety: we do not set the leftmost and rightmost values
% of AlConcMA, because we cannot calculate them. On the right that
% is okay, it just means that AlConcMA is a bit shorter. On the
% left however, the vector must start at index 1, so Matlab fills
% the first MAHalfWidth elements with zeros. Since these are really
% missing values, NaN's are more appropriate however. So set them to
% NaN.
AlConcMA(1:MAHalfWidth) = NaN;



% Visualise the results in the way of Figure 9.

% Visualise 
figure;
subplot(3, 1, 1);
plot(AlConc);
title('Raw data');

subplot(3, 1, 2);
plot(AlConcFilled);
title('No zeros, no NaNs');
ylabel('Al3+ concentration micromol/L');

subplot(3, 1, 3);
plot(1:length(AlConcMA), AlConcMA, 'b', 1:length(AlConcFilled), AlConcFilled, 'm.');
title('15-term moving average');
xlabel('time');

