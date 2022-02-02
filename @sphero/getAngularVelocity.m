function [angular_vel] = getAngularVelocity(this)
% GETANGULARVELOCITY  Retrieves the latest angular velocity reading 
% detected onboard the Sphero RVR.
%   Input:
%       none
%   Output:
%       angular_vel: A structure with fields "X", "Y", and "Z" indicating 
%                    the respective angular velocities.
%   Examples:
%       angular_vel = s.GETANGULARVELOCITY()

    % Send request
    this.request_sphero_data_m.Data = 'get_imu';
    send(this.request_sphero_data_pub, this.request_sphero_data_m);

    % Get responce
    msg = receive(this.imu_sub); % Wait for response from Sphero
    angular_vel.X = msg.AngularVelocity.X;
    angular_vel.Y = msg.AngularVelocity.Y;
    angular_vel.Z = msg.AngularVelocity.Z;
end