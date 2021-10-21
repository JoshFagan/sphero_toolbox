function [pi_image] = getDetectedColor(this)
% GETIMAGE Retrieves the latest image from the Pi Camera 
% RVR.
%   Input:
%       none
%   Output:
%       image: An image in the form of a matrix 
%   Examples:
%       my_image = s.getImage()

    msg = receive(this.image_sub); % Wait for response from Sphero
    pi_image = readImage(msg); 
end

