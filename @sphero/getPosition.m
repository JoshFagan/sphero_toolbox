function [position] = getPosition(this)
% GETPOSITION  Retrieves the latest position reading detected onboard the 
% Sphero RVR.
%   Input:
%       none
%   Output:
%       position: A structure with fields "X", "Y", and "Z" indicating the 
%                 position of the robot.
%   Examples:
%       position = s.getPosition()

    msg = receive(this.position_sub); % Wait for response from Sphero
    position.X = msg.X;
    position.Y = msg.Y;
    position.Z = msg.Z;
end

