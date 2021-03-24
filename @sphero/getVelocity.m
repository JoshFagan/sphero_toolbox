function [velocity] = getVelocity(this)
% GETVELOCITY  Retrieves the latest linear velocity reading detected
% onboard the Sphero RVR.
%   Input:
%       none
%   Output:
%       velocity: A structure with fields X, Y, and Z indicating the
%       velocity in each direction
%   Examples:
%       v = s.getVelocity()

    msg = receive(this.velocity_sub); % Wait for responce from Sphero
    velocity.X = msg.X;
    velocity.Y = msg.Y;
    velocity.Z = msg.Z;
end

