function [orientation] = getOrientation(this)
% GETORIENTATION  Retrieves the latest orientation reading detected onboard the Sphero RVR
%   orientation = GETORIENTATION() latest orientation reading

    msg = receive(this.imu_sub); % Wait for responce from Sphero
    orientation.Roll  = msg.Orientation.X;
    orientation.Pitch = msg.Orientation.Y;
    orientation.Yaw   = msg.Orientation.Z;
end