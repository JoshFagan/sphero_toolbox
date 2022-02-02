function [orientation] = getOrientation(this)
% GETORIENTATION  Retrieves the latest orientation reading detected onboard 
% the Sphero RVR.
%   Input:
%       none
%   Output:
%       orientation: A structure with fields "X", "Y", and "Z" indicating the  
%                    orientation of the robot.
%   Examples:
%       orientation = s.getOrientation()

    % Send request
    this.request_sphero_data_m.Data = 'get_imu';
    send(this.request_sphero_data_pub, this.request_sphero_data_m);

    % Get responce
    msg = receive(this.imu_sub); % Wait for response from Sphero
    orientation.Roll  = msg.Orientation.X;
    orientation.Pitch = msg.Orientation.Y;
    orientation.Yaw   = msg.Orientation.Z;
end