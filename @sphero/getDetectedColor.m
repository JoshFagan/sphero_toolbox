function [color] = getDetectedColor(this)
% GETDETECTEDCOLOR  Retrieves the latest color detected onboard the Sphero
% RVR.
%   Input:
%       none
%   Output:
%       color: A structure with the fields "R", "G", "B" and "confidence"
%              indicating the detcted RGB color and confidence in
%              identification.
%   Examples:
%       color = s.getDetectedColor()

    msg = receive(this.color_detect_sub); % Wait for response from Sphero
    color.R = msg.R; color.G = msg.G; color.B = msg.B;
    color.confidence = msg.A;
end

