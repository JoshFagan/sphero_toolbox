function [speed] = getSpeed(this)
% GETSPEED  Retrieves the latest speed reading detected onboard the Sphero
% RVR.
%   Input:
%       none
%   Output:
%       speed: A single value indicating the current speed of the robot.
%   Examples:
%       speed = s.getSpeed()

    % Send request
    this.request_data_m.Data = 'get_speed';
    send(this.request_data_pub, this.request_data_m);

    % Get responce
    msg = receive(this.speed_sub); % Wait for response from Sphero
    speed = msg.Data;
end