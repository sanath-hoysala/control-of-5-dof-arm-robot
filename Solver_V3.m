clear all;
clc;
d1 = 1;
d3 = 1;
a1 = 1;
a2 = 1;
a3 = 1;
d4 = 1; 

%alpha1 = atan(d3/a3);
phi = atan(d1/a1);

theta1 = -pi/4; theta2 = pi; theta3 = -pi/2; % theta1 is b/w -pi2 to pi/2

x = cos(theta1) * (a1 + a2 * cos(theta2 + phi) + a3 * cos(theta2 + theta3 + phi));
y = sin(theta1) * (a1 + a2 * cos(theta2 + phi) + a3 * cos(theta2 + theta3 + phi));
z = d1 + a2 * sin(theta2 + phi) + a3 * sin(theta2 + theta3 + phi);
%z = z + d3;

theta1_inv = atan(y/x);

r = sqrt(x^(2) + y^(2));
pzw = z - d1;
sw = sqrt(pzw^(2)+(r-a1)^(2));

%alpha = atan2(0,z/(r-a1));
%beta = acos(((r^(2) + a2^(2) - a3^(2))/(2 * a2 * r)));

theta3_inv1 = acos((sw^(2)-a2^(2)-a3^(2))/(2*a2*a3)) ;
theta3_inv2 = -acos((sw^(2)-a2^(2)-a3^(2))/(2*a2*a3));

theta2_inv = acos((sw^(2) + a2^(2) - a3^(2))/(2 * a2 * sw));

