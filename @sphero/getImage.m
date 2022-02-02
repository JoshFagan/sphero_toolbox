function [pi_image] = getImage(this)
% GETIMAGE Retrieves the latest image from the Pi Camera 
% RVR.
%   Input:
%       none
%   Output:
%       image: An image in the form of a matrix 
%   Examples:
%       my_image = s.getImage()

    % Send request
    this.request_rpi_data_m.Data = 'get_image';
    send(this.request_rpi_data_pub, this.request_rpi_data_m);

    msg = receive(this.image_sub); % Wait for response from Sphero
    pi_image = readImage(msg); 
end

