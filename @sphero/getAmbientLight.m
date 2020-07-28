function [light_level] = getAmbientLight(this)
% GETAMBIENTLIGHT  Retrieves the latest ambient light level onboard the Sphero RVR
%   light_level = GETAMBIENTLIGHT() retrieves the latest ambient light
%   level

    msg = receive(this.ambient_light_sub); % Wait for responce from Sphero
    light_level = msg.Data;
end