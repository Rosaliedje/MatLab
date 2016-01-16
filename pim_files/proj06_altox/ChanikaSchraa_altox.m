% Aluminium toxicity
% Chanika Schraa

% Clean environment
clear
close all
clc

% Data input
AlConc=load('al_conc.txt');

% Processing the data
AlConcZero=(AlConc==0);
AlConcNan=isnan(AlConc);

AlConcErrors=AlConcZero|AlConcNan;
Errors=find(AlConcErrors);

AlConcFilled=AlConc;

%% Writing a loop to calculate the new value for Errors
for i=Errors;
    AlConcFilled(i)=mean([AlConcFilled(i-1),AlConcFilled(i+1)]);
end


%% Calculating an integrating the MA value: mean of the value itself
% and a predertermined number (4 left, 4 right) of neighbouring elements to the left and
% right of this value

AlConcMA9=AlConcFilled;
for a=1:365;
    b=(a-4)+(0:8);
    for c=1:9;
        if b(c)<1;
            b(c)=1;
        else if b(c)>365;
            b(c)=365;
            end
        end
    end
    AlConcMA9(a)=mean(AlConcFilled(b));
end

x = 1:length(AlConc);
ax = [0,length(AlConc),0,150]
% plotting data and visualizing
subplot(3,1,1)
plot(x,AlConc)
title('Raw Data')   
axis(ax) % changing x axis (0,length(AlConc)) & y axis (0,150)

subplot(3,1,2)
plot(x,AlConcFilled)
title('No zeros, no NaNs')
axis(ax)

subplot(3,1,3)
plot(x, AlConcMA9, x, AlConcFilled, 'm.')
title('9-term moving average') % Hoe moet ik dit visualizen in magenta dots?
axis(ax)