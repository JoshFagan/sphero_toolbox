function [angular_vel] = getAngularVelocity(this)
% GETANGULARVELOCITY  Retrieves the latest angular velocity reading detected onboard the Sphero RVR
%   angular_vel = GETANGULARVELOCITY() latest angular velocity reading

    msg = receive(this.imu_sub); % Wait for responce from Sphero
    angular_vel.X = msg.AngularVelocity.X;
    angular_vel.Y = msg.AngularVelocity.Y;
    angular_vel.Z = msg.AngularVelocity.Z;
end