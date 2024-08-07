syms theta1 theta2 theta3 x y z d1 a1 a2 d3 a3 
% d1 =1;
% a1 =1;
% a2 = 1;
% d4 = 1;
% a3 = 1;

DH = [theta1 0 0 0;
      0 d1 0 0;
      theta2+pi/2 0 a1 pi/2;
      theta3-pi/2 0 a2 0;
       0 0 a3 pi/2 ];

for i=1:length(DH)
    theta = DH(i,1); d = DH(i,2); a = DH(i,3); alpha = DH(i,4);
    switch(i)
        case 1
            T_1 = [cos(theta) sin(theta) 0 a;
                        sin(theta)*cos(alpha) cos(theta)*cos(alpha) -sin(alpha) -sin(alpha)*d;
                        sin(theta)*sin(alpha) cos(theta)*sin(alpha) cos(alpha) cos(alpha)*d;
                        0 0 0 1]

        case 2 
            T_2 = [cos(theta) sin(theta) 0 a;
                        sin(theta)*cos(alpha) cos(theta)*cos(alpha) -sin(alpha) -sin(alpha)*d;
                        sin(theta)*sin(alpha) cos(theta)*sin(alpha) cos(alpha) cos(alpha)*d;
                        0 0 0 1]

        case 3
            T_3 = [cos(theta) sin(theta) 0 a;
                        sin(theta)*cos(alpha) cos(theta)*cos(alpha) -sin(alpha) -sin(alpha)*d;
                        sin(theta)*sin(alpha) cos(theta)*sin(alpha) cos(alpha) cos(alpha)*d;
                        0 0 0 1]

        case 4
            T_4 = [cos(theta) sin(theta) 0 a;
                        sin(theta)*cos(alpha) cos(theta)*cos(alpha) -sin(alpha) -sin(alpha)*d;
                        sin(theta)*sin(alpha) cos(theta)*sin(alpha) cos(alpha) cos(alpha)*d;
                        0 0 0 1]

        case 5
            T_5 = [cos(theta) sin(theta) 0 a;
                        sin(theta)*cos(alpha) cos(theta)*cos(alpha) -sin(alpha) -sin(alpha)*d;
                        sin(theta)*sin(alpha) cos(theta)*sin(alpha) cos(alpha) cos(alpha)*d;
                        0 0 0 1]

    end    
end

T_mat = simplify(T_1*T_2*T_3*T_4*T_5)
End_eff_ORG = T_mat*[0 0 0 1]'



