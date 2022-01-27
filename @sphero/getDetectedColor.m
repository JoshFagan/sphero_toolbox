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

    % Send request
    this.request_data_m.Data = 'get_color_detected';
    send(this.request_data_pub, this.request_data_m);

    % Get responce
    msg = receive(this.color_detect_sub); % Wait for response from Sphero
    color.R = msg.R; color.G = msg.G; color.B = msg.B;
    color.confidence = msg.A;
end

