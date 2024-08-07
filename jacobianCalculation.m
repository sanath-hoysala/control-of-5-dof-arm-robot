function jacobian = jacobianCalculation(theta1, theta2, theta3, L1, L2, L3, phi)
    jacobian = [
        -L2 * sin(theta1) * (cos(theta2 + phi) + L3 / L2 * cos(theta2 + theta3 + phi)) - L3 * sin(theta1) * cos(theta2 + theta3 + phi),
        -L1 * sin(theta1) * sin(theta2) + L3 * cos(theta1) * sin(theta2 + theta3),
        L1 * cos(theta1) * cos(theta2) + L2 * sin(theta2) * cos(phi) + L3 * sin(phi) * sin(theta2 + theta3);
        L1 * cos(theta1) * sin(theta2) * cos(phi) + L2 * sin(theta2) * sin(phi) - L3 * cos(theta2 + theta3 + phi) * cos(phi),
        L1 * cos(theta1) * sin(theta2) * sin(phi) + L2 * cos(phi) * sin(theta2) - L3 * cos(theta2 + theta3 + phi) * sin(phi),
        -L1 * sin(theta1) * sin(theta2) * sin(phi) - L2 * cos(theta2) * cos(phi) - L3 * cos(theta2 + theta3 + phi) * sin(phi)
    ];
end