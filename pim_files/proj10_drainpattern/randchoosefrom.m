function indexOut = randchoosefrom(V)
% % Keywords: random selection, math
% % indexOut = randchoosefrom(V)
% % 	randchoosefrom randomly chooses an element from the vector "V"
% % 	
% %              NAME        DIMENSION              
% % 	INPUT    V           any iterable type      
% % 	OUTPUT   indexOut    1x1 same as input type
% % 	
% % 	authors         : Spaaks & Kraal
% % 	date            : 10-Oct-2003
% % 	matlab-version  : 6.5  Release 13

% determine length of input vector "V"
L = numel(V);

% randperm(n) is a random permutation of the integers from 1 to L
d = randperm(L);

% Since "d" contains random values, it is legal to pick 
% the first value from "d" and use this to choose a value
% from input vector "V".
indexOut =  V(d(1));
