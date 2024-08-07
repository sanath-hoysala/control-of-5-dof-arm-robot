function forwardKinematics = forwardKinematicsCalculation(theta1, theta2, theta3, L1, L2, L3, L4, phi)
    % Forward kinematics calculations
    x = L1 * cos(theta1) + L2 * cos(theta1 + theta2 + phi) + L3 * cos(theta1 + theta2 + theta3 + phi) + L4 * cos(theta1 + theta2 + theta3 + 2 * phi);
    y = L1 * sin(theta1) + L2 * sin(theta1 + theta2 + phi) + L3 * sin(theta1 + theta2 + theta3 + phi) + L4 * sin(theta1 + theta2 + theta3 + 2 * phi);
    z = L2 * cos(theta1) + L3 * cos(theta1 + theta2 + phi) + L4 * cos(theta1 + theta2 + theta3 + 2 * phi);

    forwardKinematics = [x; y; z];
end