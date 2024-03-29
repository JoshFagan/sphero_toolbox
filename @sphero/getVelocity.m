function [velocity] = getVelocity(this)
% GETVELOCITY  Retrieves the latest linear velocity reading detected
% onboard the Sphero RVR.
%   Input:
%       none
%   Output:
%       velocity: A structure with fields "X", "Y", and "Z" indicating the
%                 velocity in each direction.
%   Examples:
%       v = s.getVelocity()

    % Send request
    this.request_sphero_data_m.Data = 'get_velocity';
    send(this.request_sphero_data_pub, this.request_sphero_data_m);

    % Get responce
    msg = receive(this.velocity_sub); % Wait for response from Sphero
    velocity.X = msg.X;
    velocity.Y = msg.Y;
    velocity.Z = msg.Z;
end

