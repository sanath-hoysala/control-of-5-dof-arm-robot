clc;
clear all;
syms theta1 theta2 theta3 
%variables 
d1 = 1;
d3 = 3;
a1 = 2;
a2 = 2;
a3 = 2;
d4 = 2;

%Constant link values
l2 = 5;
l3 = 5;
l4 = 2;

%[theta d a alpha sigma]; sigma=1 = prismatic; sigma=0 = revolute;
DH = [0 0 0 0;
      0 d1 0 0;
      pi/2 0 a1 pi/2;
      -pi/2 0 a2 0;
       0 d4 a3 pi/2 ];


l(1) = Link([DH(1,:) 0],'modified');
l(1).qlim = [-pi pi];

l(2) = Link([DH(2,:) 0],'modified');
%l(2).qlim = [-109*pi/180 98.9*pi/180];

l(3) = Link([DH(3,:) 0],'modified');
l(3).qlim = [-109*pi/180 98.9*pi/180];

l(4) = Link([DH(4,:) 0],'modified');
l(4).qlim = [-pi pi];

l(5) = Link([DH(5,:) 0],'modified');

Cart = SerialLink(l, 'name', 'Cart')
Cart.plot([0 0 0 0 0], 'workspace', [-20 20 -20 20 -20 20]);
Cart.teach()


T = Cart.fkine([0 0 0 pi 0]);
disp(T);

% T_desired = T;

% % Solve inverse kinematics
% q = Cart.ikine(T_desired, 'mask', [1 1 1 1 1 0]);
% disp(q);
