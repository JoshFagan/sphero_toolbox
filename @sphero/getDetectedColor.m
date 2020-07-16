function getDetectedColor()
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    message_received = receive(this.color_detect_sub).Data; % Wait for responce from Sphero
    disp(message_received)
end

