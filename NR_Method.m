syms theta1 theta2 theta3 a1 a2 d1 a3 phi
clear all;
clc;
nmax = 100;
max_err = 1e-3;

%lengths in mm
d1 = 62.5;
a1 = 41.20509591;
a2 = 178.45003439;
a3 = 170.35097;
phi = atan(d1/a1);
x_des = 430;
y_des = 10;
z_des = 70;

f1 = @(theta1,theta2,theta3,a1,a2,d1,a3,phi) cos(theta1) * (a1 + a2 * cos(theta2 + phi) + a3 * cos(theta2 + theta3 + phi)) -x_des;
f2 = @(theta1,theta2,theta3,a1,a2,d1,a3,phi) sin(theta1) * (a1 + a2 * cos(theta2 + phi) + a3 * cos(theta2 + theta3 + phi)) -y_des;
f3 = @(theta1,theta2,theta3,a1,a2,d1,a3,phi) d1 + a2 * sin(theta2 + phi) + a3 * sin(theta2 + theta3 + phi) -z_des;

 f1 =  cos(theta1) * (a1 + a2 * cos(theta2 + phi) + a3 * cos(theta2 + theta3 + phi)) -x_des;
 f2 =  sin(theta1) * (a1 + a2 * cos(theta2 + phi) + a3 * cos(theta2 + theta3 + phi)) -y_des;
 f3 =  d1 + a2 * sin(theta2 + phi) + a3 * sin(theta2 + theta3 + phi) -z_des;



% jacob = [diff(f1(theta1,theta2,theta3,a1,a2,d1,a3,phi),theta1) diff(f1(theta1,theta2,theta3,a1,a2,d1,a3,phi),theta2) diff(f1(theta1,theta2,theta3,a1,a2,d1,a3,phi),theta3);
%          diff(f2(theta1,theta2,theta3,a1,a2,d1,a3,phi),theta1) diff(f2(theta1,theta2,theta3,a1,a2,d1,a3,phi),theta2) diff(f2(theta1,theta2,theta3,a1,a2,d1,a3,phi),theta3);
%          diff(f3(theta1,theta2,theta3,a1,a2,d1,a3,phi),theta1) diff(f3(theta1,theta2,theta3,a1,a2,d1,a3,phi),theta2) diff(f3(theta1,theta2,theta3,a1,a2,d1,a3,phi),theta3)];


% jacob_cal = [-sin(theta1)*((5993691914173457*cos(phi + theta2 + theta3))/35184372088832 + (6278652409242627*cos(phi + theta2))/35184372088832 + 2899550852906899/70368744177664), -cos(theta1)*((5993691914173457*sin(phi + theta2 + theta3))/35184372088832 + (6278652409242627*sin(phi + theta2))/35184372088832), -(5993691914173457*sin(phi + theta2 + theta3)*cos(theta1))/35184372088832;
%              cos(theta1)*((5993691914173457*cos(phi + theta2 + theta3))/35184372088832 + (6278652409242627*cos(phi + theta2))/35184372088832 + 2899550852906899/70368744177664), -sin(theta1)*((5993691914173457*sin(phi + theta2 + theta3))/35184372088832 + (6278652409242627*sin(phi + theta2))/35184372088832), -(5993691914173457*sin(phi + theta2 + theta3)*sin(theta1))/35184372088832;
%                                                                                                                                                                   0,                (5993691914173457*cos(phi + theta2 + theta3))/35184372088832 + (6278652409242627*cos(phi + theta2))/35184372088832,              (5993691914173457*cos(phi + theta2 + theta3))/35184372088832];

ii=1;
error(ii)=10;
theta1(ii) = 1;
theta2(ii) = -pi;
theta3(ii) = -pi;
while(ii<nmax)&&(error(ii)>max_err)
    jacob_cal = [-sin(theta1(ii))*((5993691914173457*cos(phi + theta2(ii) + theta3(ii)))/35184372088832 + (6278652409242627*cos(phi + theta2(ii)))/35184372088832 + 2899550852906899/70368744177664), -cos(theta1(ii))*((5993691914173457*sin(phi + theta2(ii) + theta3(ii)))/35184372088832 + (6278652409242627*sin(phi + theta2(ii)))/35184372088832), -(5993691914173457*sin(phi + theta2(ii) + theta3(ii))*cos(theta1(ii)))/35184372088832;
             cos(theta1(ii))*((5993691914173457*cos(phi + theta2(ii) + theta3(ii)))/35184372088832 + (6278652409242627*cos(phi + theta2(ii)))/35184372088832 + 2899550852906899/70368744177664)     , -sin(theta1(ii))*((5993691914173457*sin(phi + theta2(ii) + theta3(ii)))/35184372088832 + (6278652409242627*sin(phi + theta2(ii)))/35184372088832), -(5993691914173457*sin(phi + theta2(ii) + theta3(ii))*sin(theta1(ii)))/35184372088832;
                                                                                                                                             0                             , (5993691914173457*cos(phi + theta2(ii) + theta3(ii)))/35184372088832 + (6278652409242627*cos(phi + theta2(ii)))/35184372088832                   , (5993691914173457*cos(phi + theta2(ii) + theta3(ii)))/35184372088832];
    fx1 = cos(theta1(ii)) * (a1 + a2 * cos(theta2(ii) + phi) + a3 * cos(theta2(ii) + theta3(ii) + phi))-x_des; 
    fx2 = sin(theta1(ii)) * (a1 + a2 * cos(theta2(ii) + phi) + a3 * cos(theta2(ii) + theta3(ii) + phi))-y_des;
    fx3 = d1 + a2 * sin(theta2(ii) + phi) + a3 * sin(theta2(ii) + theta3(ii) + phi) -z_des;
    fx = [ fx1;
           fx2;
           fx3];
    theta = [theta1(ii); theta2(ii); theta3(ii)] - jacob_cal\fx;
    ii = ii+1;
    theta1(ii) = theta(1);
    theta2(ii) = theta(2);
    theta3(ii) = theta(3);
    error(ii) = norm(fx);
end

x_est = cos(theta(1)) * (a1 + a2 * cos(theta(2) + phi) + a3 * cos(theta(2) + theta(3) + phi));
y_est = sin(theta(1)) * (a1 + a2 * cos(theta(2) + phi) + a3 * cos(theta(2) + theta(3) + phi));
z_est = d1 + a2 * sin(theta(2) + phi) + a3 * sin(theta(2) + theta(3) + phi);






