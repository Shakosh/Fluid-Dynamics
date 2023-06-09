function thetas = gettheta(delta, M_1)

    syms theta  % define symbolic variable theta

    num = M_1^2*sind(theta)^2 - 1;
    den = M_1^2*(1.4 + cosd(2*theta)) + 2;
    func = tand(delta) - 2*cotd(theta)*(num/den);
    func_theta = matlabFunction(func);  % convert symbolic function to function handle
    
    theta_values = linspace(0,90,1000);  % range of theta values in degrees
    func_values = arrayfun(func_theta, theta_values);  % evaluate the function at these values

    % Finding where the function crosses zero
    zero_crossing_indices = find(diff(sign(func_values)));
    zero_crossing_theta_values = theta_values(zero_crossing_indices);
    thetas = zero_crossing_theta_values;  % return the theta values where the function crosses zero
end

%     figure
%     plot(theta_values, func_values)
%     xlabel('theta')
%     ylabel('Function value')
%     grid on


    

    
