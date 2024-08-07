syms theta1 theta2 theta3 
d1 = 1;
d3 = 3;
a1 = 2;
a2 = 2;
a3 = 2;

% theta1 = pi; theta2 = pi/6; theta3 = pi/3;

phi = atan2(0,d1/a1);
% x_cord = cos(theta1)* (a1+a2*cos(theta2+phi) + a3*cos(theta2+theta3+phi));
% y_cord = sin(theta1)* (a1+a2*cos(theta2+phi) + a3*cos(theta2+theta3+phi));
% z_cord = d1 + a2*sin(theta2+phi) + a3*sin(theta2 + theta3 +phi);


eqn1= [cos(theta1)* (a1+a2*cos(theta2+phi) + a3*cos(theta2+theta3+phi)) == x_cord 
     ,sin(theta1)* (a1+a2*cos(theta2+phi) + a3*cos(theta2+theta3+phi)) == y_cord 
     ,d1 + a2*sin(theta2+phi) + a3*sin(theta2 + theta3 +phi)  == z_cord ];

[theta1_inv, theta2_inv, thea3_inv] = solve(eqn1 );

