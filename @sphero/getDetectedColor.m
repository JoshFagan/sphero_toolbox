function [color, confidence] = getDetectedColor(this)
% GETDETECTEDCOLOR  Retrieves the latest color detected onboard the Sphero RVR
%   color = GETDETECTEDCOLOR() retrieves the latest color detected
%   color, confidence = GETDETECTEDCOLOR() retrieves the latests color
%   detected and the confidence in that color being correctly classified

    msg = receive(this.color_detect_sub); % Wait for responce from Sphero
    color = [msg.R, msg.G, msg.B];
    confidence = msg.A;
end

