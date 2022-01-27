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

    % Send request
    this.request_data_m.Data = 'get_imu';
    send(this.request_data_pub, this.request_data_m);

    % Get responce
    msg = receive(this.imu_sub); % Wait for response from Sphero
    acceleration.X = msg.LinearAcceleration.X;
    acceleration.Y = msg.LinearAcceleration.Y;
    acceleration.Z = msg.LinearAcceleration.Z;
end