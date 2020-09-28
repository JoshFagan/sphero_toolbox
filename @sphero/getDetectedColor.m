function [color] = getDetectedColor(this)
% GETDETECTEDCOLOR  Retrieves the latest color detected onboard the Sphero RVR
%   color = GETDETECTEDCOLOR() retrieves the latest color detected
%   color, confidence = GETDETECTEDCOLOR() retrieves the latests color
%   detected and the confidence in that color being correctly classified

    msg = receive(this.color_detect_sub); % Wait for responce from Sphero
    color.R = msg.R; color.G = msg.G; color.B = msg.B;
    color.confidence = msg.A;
end

