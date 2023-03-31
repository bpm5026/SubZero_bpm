% clear all; close all;
% cd ..
% paths

%Test to make sure energy is not created during collisions. Set to have no ocean/atmosphere interactions
%test floes
x1 = [2 2 5 5]*1e4; y1 = [2 5 5 2]*1e4;
x2 = [6 6 9 9]*1e4; y2 = [2 5 5 2]*1e4;
x3 = [5.5 5.25 5.75]*1e4; y3 = [2 4 4]*1e4;
poly1 = polyshape(x1,y1);
poly2 = polyshape(x2,y2);
poly3 = polyshape(x3,y3);
% load('FloeShapes.mat')
% complex1 = poly(5); complex2 = poly(4); complex2 = translate(complex2,-[1e4 4e4]);
height.mean = 0.25;
height.delta = 0;


%% Two blocks crashing head on - no rotation
Floe1 = initialize_floe_values(poly1, height); Floe1.Ui = 0.15; Floe1.Vi = 0.02;
Floe2 = initialize_floe_values(poly2, height); Floe2.Ui = -0.1; Floe2.Vi = 0.02;


% [K,~]=Subzero_conservation([Floe1;Floe2],0);
[K,~]=Subzero_conservation([Floe1;Floe2],0);
assert(K(end)/K(1)<1)
% 
% %%Two blocks crashing offset - rotation
% Floe1 = initialize_floe_values(translate(poly1,[0 1e4]), height); Floe1.Ui = 0.11; Floe1.Vi = 0.02;
% Floe2 = initialize_floe_values(poly2, height); Floe2.Ui = -0.1; Floe2.Vi = 0.02;
% 
% [K,~]=Subzero_conservation([Floe1;Floe2],0);
% assert(K(end)/K(1)<1)
%  
% %%Two rectangular boxes with a triangle inbetween causing rotation
% Floe1 = initialize_floe_values(poly1, height); Floe1.Ui = 0.11; Floe1.Vi = 0.001;
% Floe2 = initialize_floe_values(poly2, height); Floe2.Ui = -0.1; Floe2.Vi = 0.001;
% Floe3 = initialize_floe_values(poly3, height); Floe3.Ui = -0; Floe3.Vi = 0.001;
% 
% [K,~]=Subzero_conservation([Floe1;Floe2;Floe3],0);
% assert(K(end)/K(1)<1)
% 
% %%Two complex (many-sided, non-convex) floes hitting
% Floe1 = initialize_floe_values(complex1, height); Floe1.Ui = -0.11; Floe1.Vi = 0.02;
% Floe2 = initialize_floe_values(complex2, height); Floe2.Ui = 0.1; Floe2.Vi = 0.02;
% 
% [K,~]=Subzero_conservation([Floe1;Floe2],0);
% assert(K(end)/K(1)<1)
% 
% %%One non-convex block hits the wall
% Floe1 = initialize_floe_values(translate(complex1,[7.75e4 0]), height); Floe1.Ui = 0.11; Floe1.Vi = 0.02;
% 
% [K,~]=Subzero_conservation(Floe1,0);
% assert(K(end)/K(1)<1)

