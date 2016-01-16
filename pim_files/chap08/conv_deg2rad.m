function [OutRad] = conv_deg2rad(InDeg)
% % keywords: degrees, radians, conversion
% % [OutRad] = deg2rad(InDeg)
% % Converts input argument to radians
% % input           : InDeg       1x1 numeric array
% % output          : OutRad      1x1 numeric array
% % authors         : Spaaks & Kraal
% % date            : 09-Sep-2003
% % matlab-version  : 6.5  Release 13

% Convert degrees to radians
OutRad = (InDeg/360)*(2*pi);
