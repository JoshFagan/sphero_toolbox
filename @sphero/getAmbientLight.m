function [light_level] = getAmbientLight(this)
% GETAMBIENTLIGHT  Retrieves the latest ambient light level onboard the
% Sphero RVR.
%   Input:
%       none
%   Output:
%       light_level: A single value indicating the latest ambient light
%                    level.
%   Examples:
%       light_level = s.GETAMBIENTLIGHT()

    % Send request
    this.request_data_m.Data = 'get_ambient_light';
    send(this.request_data_pub, this.request_data_m);

    % Get responce
    msg = receive(this.ambient_light_sub); % Wait for response from Sphero
    light_level = msg.Data;
end