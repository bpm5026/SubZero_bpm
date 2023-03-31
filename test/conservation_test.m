clear all; close all;

x1 = [2 2 5 5]*1e4; y1 = [2 5 5 2]*1e4;
x2 = [6 6 9 9]*1e4; y2 = [2 5 5 2]*1e4;
x3 = [5.5 5.25 5.75]*1e4; y3 = [2 4 4]*1e4;
poly1 = polyshape(x1,y1);
poly2 = polyshape(x2,y2);
poly3 = polyshape(x3,y3);
height.mean = 0.25;
height.delta = 0;

Floe1 = initialize_floe_values(poly1, height); Floe1.Ui = 0.15; Floe1.Vi = 0.02;
Floe2 = initialize_floe_values(poly2, height); Floe2.Ui = -0.1; Floe2.Vi = 0.02;

[K1,T1]=Subzero_conservation([Floe1;Floe2],0);

Floe1 = initialize_floe_values(translate(poly1,[0 1e4]), height); Floe1.Ui = 0.11; Floe1.Vi = 0.02;
Floe2 = initialize_floe_values(poly2, height); Floe2.Ui = -0.1; Floe2.Vi = 0.02;

[K2,T2]=Subzero_conservation([Floe1;Floe2],0);

Floe1 = initialize_floe_values(translate(poly1,[0 1e4]), height); Floe1.Ui = 0.11; Floe1.Vi = 0.02;
Floe2 = initialize_floe_values(poly2, height); Floe2.Ui = -0.1; Floe2.Vi = 0.02;

[K3,T3]=Subzero_conservation([Floe1;Floe2],0);

Floe1 = initialize_floe_values(poly1, height); Floe1.Ui = 0.11; Floe1.Vi = 0.001;
Floe2 = initialize_floe_values(poly2, height); Floe2.Ui = -0.1; Floe2.Vi = 0.001;
Floe3 = initialize_floe_values(poly3, height); Floe3.Ui = -0; Floe3.Vi = 0.001;

[K4,T4]=Subzero_conservation([Floe1;Floe2;Floe3],0);

load('./test/FloeShapes.mat')
complex1 = poly(5); complex2 = poly(4); complex2 = translate(complex2,-[1e4 4e4]);
Floe1 = initialize_floe_values(complex1, height); Floe1.Ui = -0.11; Floe1.Vi = 0.02;
Floe2 = initialize_floe_values(complex2, height); Floe2.Ui = 0.1; Floe2.Vi = 0.02;

[K5,T5]=Subzero_conservation([Floe1;Floe2],0);

Floe1 = initialize_floe_values(translate(complex1,[7.75e4 0]), height); Floe1.Ui = 0.11; Floe1.Vi = 0.02;

[K6,T6]=Subzero_conservation(Floe1,0);
plot(T1,K1)
hold on
plot(T2,K2); plot(T3,K3); plot(T4,K4); plot(T5,K5); plot(T6,K6)