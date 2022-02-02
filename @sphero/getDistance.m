function [distance] = getDistance(this)
% GETDISTANCE  Retrieves the latest distance measure, in inches, from  onboard the
% Sphero RVR.
%   Input:
%       none
%   Output:
%       distance: A single value indicating the distance, in inches, from
%                 the Sphero RVR to an obstacle.
%   Examples:
%       distance = s.GETDISTANCE()

    % Send request
    this.request_rpi_data_m.Data = 'get_distance';
    send(this.request_rpi_data_pub, this.request_rpi_data_m);

    % Get responce
    msg = receive(this.distance_sub); % Wait for response from Sphero
    distance = msg.Data;
end