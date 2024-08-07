
d1 = 62.5;
a1 = 41.20509591;
a2 = 178.45003439;
a3 = 170.35097;


theta2 = pi/6;
theta3 =0;
phi=atan2(0,d1/a1);
x_des = 10;
y_des = 10;
z_des = 10;
i=1;

for theta1=0:0.001:2*pi
    f1(i) = cos(theta1) * (a1 + a2 * cos(theta2 + phi) + a3 * cos(theta2 + theta3 + phi)) -x_des;
    f2(i) = sin(theta1) * (a1 + a2 * cos(theta2 + phi) + a3 * cos(theta2 + theta3 + phi)) -y_des;
    f3(i) = d1 + a2 * sin(theta2 + phi) + a3 * sin(theta2 + theta3 + phi) -z_des;
    i=i+1;
end 
theta1=0:0.001:2*pi;
figure;
plot(theta1,f1);

