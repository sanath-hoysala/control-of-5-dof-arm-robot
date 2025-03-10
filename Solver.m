clc;
% d1 = 1;
% d3 = 3;
% a1 = 2;
% a2 = 2;
% a3 = 2;
% d4 = 2;

d1 =1;
a1 =1;
a2 = 1;
a3 = 1;
d3 = 1;
alpha = atan2(d3,a3);

%forward kinematics
%aneesh
%y_cord = a1 + d1*cos(alpha) + a2*cos(theta2) + a3*cos(theta3);

% %sanath
theta1 = pi/3 ; theta2 = pi/4; theta3 = pi/3;
x_cord = a1*cos(theta1) + a2*cos(theta2)*cos(theta1)  + sqrt(a3^2 + d3^2)*cos(theta1)*cos(theta3 - alpha);
y_cord = a1*sin(theta1) + a2*cos(theta2)*sin(theta1)  + sqrt(a3^2 + d3^2)*sin(theta1)*cos(theta3 - alpha);
z_cord = d1 + a2*sin(theta2) + a3*sin(theta3);

%DH 
x = -cos(theta1)*(d3*sin(theta2 + theta3) - a1 + a2*sin(theta2) + a3*cos(theta2 - theta3));
y = sin(theta1)*(d3*sin(theta2 + theta3) - a1 + a2*sin(theta2) + a3*cos(theta2 - theta3));
z = d1 + a3*sin(theta2 + theta3) + a2*cos(theta2) + d3*cos(theta2 - theta3);

%Inverse Kinematics
theta1_inv = atan2(y_cord,x_cord);
beta = y_cord/sin(theta1_inv) - a1 - d3*cos(alpha);
gamma = z_cord - d1;
K = (a2 / (2*a3)) + (a2/(3*a3^2));
L = beta/(a3^2);
M = (beta^2/(2*a2*a3^2)) + (gamma^2/(2*a2*a3)) - (a2/(2*a3)) - (a3/(2*a2));
S = 4*a2^(2)*(a3^2 - beta^2);
T = 4*(a2^(2)*beta^(2) - (a2*a3)^2 - a2^4);
U = 8*beta*a2^3;
V = 4*a2^4;
A = K^2 - V;
B = U - 2*K*L;
C = 2*K*M + L^2 -T;
D = 2*L*M;
E = M^(2) - S;

p1 = 2*C^(2) - 9*B*C*D + 27*A*D^(2) + 27*E*B^(2) - 72*A*C*E;
p2 = p1 + sqrt((-4*(C^(2) - 3*B*D + 12*A*E)^(3)) + p1^(2));
p3 = ((C^(2) - 3*B*D + 12*A*E)/(3*A*(p2/2)^(1/3))) + ((p2/2)^(3)/(3*A));
p4 = sqrt((B^(2)/(4*A^(2))) - ((2*C)/(3*A)) + p3);
p5 = (B^(2)/(2*A^(2))) - ((4*C)/(3*A)) - p3;
p6 = ( ((-B^(3))/(A^(3))) +  ((4*B*C)/(A^(2))) - ((8*D)/A) )/(4*p4);

x1 = (-B/4*A) - (p4/2) - (sqrt(p5-p6)/2)
x2 = (-B/4*A) - (p4/2) + (sqrt(p5-p6)/2)
x3 = (-B/4*A) + (p4/2) - (sqrt(p5-p6)/2)
x4 = (-B/4*A) + (p4/2) + (sqrt(p5-p6)/2)

theta2_inv_1= abs(acos(x1));
theta2_inv_2= abs(acos(x2));
theta2_inv_3= abs(acos(x3));
theta2_inv_4= abs(acos(x4));
% y = (beta - a2*x)/(a3);
% 
% theta2_inv = acos(x);
% theta3_inv = acos(y);















