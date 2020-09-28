function [acceleration] = getAcceleration(this)
% GETACCELERATION Retrieves the latest acceleration reading detected onboard the Sphero RVR
%   acceleration = GETACCELERATION() latest acceleration reading

    msg = receive(this.imu_sub); % Wait for responce from Sphero
    acceleration.X = msg.LinearAcceleration.X;
    acceleration.Y = msg.LinearAcceleration.Y;
    acceleration.Z = msg.LinearAcceleration.Z;
end