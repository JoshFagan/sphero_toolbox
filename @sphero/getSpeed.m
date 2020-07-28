function [speed] = getSpeed(this)
% GETSPEED  Retrieves the latest speed reading detected onboard the Sphero RVR
%   speed = GETSPEED() latest speed reading

    msg = receive(this.speed_sub); % Wait for responce from Sphero
    speed = msg.Data;
end