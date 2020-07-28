function [position] = getPosition(this)
% GETPOSITION  Retrieves the latest position reading detected onboard the Sphero RVR
%   position = GETPOSITION() latest position reading

    msg = receive(this.position_sub); % Wait for responce from Sphero
    position.X = msg.X;
    position.Y = msg.Y;
    position.Z = msg.Z;
end

