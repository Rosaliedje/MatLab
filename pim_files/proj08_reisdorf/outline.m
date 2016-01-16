function WaterHeight = approxh(DEM,ActVol,CellSizeX,CellSizeY,Criterion)
% %  Keywords: bisection, approximation, waterheight, mathematics
% %  This function approximates the water height in a lake using 
% %  the bisection approximation method.
% %
% %  INPUT        DESCRIPTION                              DIMENSION
% %  DEM          Digital Elevation Model [m]              2-D numeric array
% %  ActVol       actual water volume in the lake [m3]     1x1 numeric array
% %  CellSizeX    cell size in x direction [m]             1x1 numeric array
% %  CellSizeY    cell size in y direction [m]             1x1 numeric array
% %  Criterion    maximum acceptable difference in height  1x1 numeric array
% %               between hUp and hLo [m]              
% %
% %  OUTPUT       DESCRIPTION                              DIMENSION
% %  WaterHeight  approximated water height [m]            1x1 numeric array
% %
% %  Authors         : Jurriaan H. Spaaks
% %  Date            : 10-Sep-2003
% %  Matlab version  : 6.5 R13
% %


%%%%%%%%%%%%%%%%%% INITIALIZATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Define initial states of variables (water heights)

%Start a record of water heights

%%%%%%%%%%%%%%%%%% CALCULATIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while (hUp - hLo) > Criterion 
     
    % calculate water volumes with 'calcvol.m' for hMid
	
    % implement bisection method using if-else-end structure
    
    % concatenate the record of water heights with the current hL, hMid and hU
    
    % visualize the height record

    % force MATLAB to make a figure before continuing:
    drawnow
	
end %while

%%%%%%%%%%%%%%%%%% OUTPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Assign final approximated value of hMid to output variable WaterHeight