function inverseKinematics()
    % Parameters
    L1 = 62.5; % mm
    L2 = 41.20509591; % mm
    L3 = 178.45003439; % mm
    L4 = 170.35097; % mm
    phi = atan(L1 / L2);

    % Desired end-effector position
    x_desired = -430; % mm
    y_desired = 0; % mm
    z_desired = 70; % mm

    % Initial joint angles
    theta1 = pi / 2;
    theta2 = pi / 6;
    theta3 = pi / 4;

    % Iterate until convergence or maximum iterations reached
    max_iterations = 1000;
    max_error = 1e-5;
    iteration = 1;
    error = 10;

    while (iteration < max_iterations) && (error > max_error)
        jacobian = jacobianCalculation(theta1, theta2, theta3, L1, L2, L3, phi);
        forwardKinematics = forwardKinematicsCalculation(theta1, theta2, theta3, L1, L2, L3, L4, phi);
        delta_theta = -jacobian \ forwardKinematics;

        theta1 = theta1 + delta_theta(1);
        theta2 = theta2 + delta_theta(2);
        theta3 = theta3 + delta_theta(3);

        iteration = iteration + 1;
        forwardKinematics = forwardKinematicsCalculation(theta1, theta2, theta3, L1, L2, L3, L4, phi);
        error = norm(forwardKinematics);
    end

    % Calculate the final end-effector position
    x_estimated = forwardKinematics(1);
    y_estimated = forwardKinematics(2);
    z_estimated = forwardKinematics(3);

    fprintf('Desired position: (%.2f, %.2f, %.2f) mm\n', x_desired, y_desired, z_desired);
    fprintf('Estimated position: (%.2f, %.2f, %.2f) mm\n', x_estimated, y_estimated, z_estimated);
end

 