function driveBackwardSeconds(this, speed, time_to_drive)
% DRIVEBACKWARDSECONDS Drive the Sphero RVR backward at specified speed for
% the specified time
%   Input:
%       speed: Integer between 0 and 255
%       time: Time to drive in seconds
%   Output:
%       none
%   Examples:
%       s.driveBackwardSeconds(60, 15)
                              

    if nargin == 1
        warning('Wheel speed and time to drive required.');
        return
    elseif nargin == 2
        warning('Time to drive required.');
        return
    end
    
    if ~isnumeric(speed) 
        warning('Integer needed for speed.');
        return
    elseif ~isnumeric(time_to_drive)
        warning('Integer neede for time to drive.');
        return
    end
    
    args = sprintf('--command drive_backward_seconds --left_speed %d --time %d', ...
                   speed, time_to_drive);
    this.drive_control_m.Data = args;
    send(this.drive_control_pub, this.drive_control_m);
end