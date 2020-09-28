function [velocity] = getVelocity(this)
% GETVELOCITY  Retrieves the latest linear velocity reading detected onboard the Sphero RVR
%   velocity = GETVELOCITY() latest linear velocity reading

    msg = receive(this.velocity_sub); % Wait for responce from Sphero
    velocity.X = msg.X;
    velocity.Y = msg.Y;
    velocity.Z = msg.Z;
end

