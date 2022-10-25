function [acceleration] = getAcceleration(this)
% GETACCELERATION Retrieves the latest acceleration reading detected onboard 
% the Sphero RVR.
%   Input:
%       none
%   Output:
%       acceleration: A structure with fields "X", "Y", and "Z" indicating 
%                     the linear acceleration of the robot.
%   Examples:
%       acceleration = s.getAcceleration()

    % Check to see if backend service topics have been created
    try
        rostopic('info', '/matlab_interface/drive_command');
    catch E
        warning('Cannot execute command "turnAngle" as the drive control systems are not online yet.')
    end

    % Check to see if sphero sensor request topic has been subscribed to          
    if isempty(rostopic('info', '/sphero_sensors/request_data').Subscribers) || ...
       isempty(rostopic('info', '/sphero_sensors/imu').Publishers)
        warning('Cannot execute command "getAcceleration" as the IMU not online yet.')
        return
    end

    % Send request
    this.request_sphero_data_m.Data = 'get_imu';
    send(this.request_sphero_data_pub, this.request_sphero_data_m);

    % Get responce
    msg = receive(this.imu_sub); % Wait for response from Sphero
    acceleration.X = msg.LinearAcceleration.X;
    acceleration.Y = msg.LinearAcceleration.Y;
    acceleration.Z = msg.LinearAcceleration.Z;
end