function [speed] = getSpeed(this)
% GETSPEED  Retrieves the latest speed reading detected onboard the Sphero RVR
% onboard the Sphero RVR.
%   Input:
%       none
%   Output:
%       speed: A single value indicating the current speed of the robot
%   Examples:
%       speed = s.getSpeed()

    msg = receive(this.speed_sub); % Wait for responce from Sphero
    speed = msg.Data;
end