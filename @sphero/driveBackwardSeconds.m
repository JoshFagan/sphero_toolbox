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
    
    this.drive_control_m.Command    = 'drive_backward_seconds';
    this.drive_control_m.LeftSpeed  = speed;
    this.drive_control_m.RightSpeed = speed;
    this.drive_control_m.Time       = time_to_drive;

    sendGoal(this.drive_control_ac, this.drive_control_m);
end