function setDriveSpeed(this, left_wheel_speed, right_wheel_speed)
% SETDRIVESPEED Set the speed at which the robot's wheels move.
%   Input:
%       left_weel_speed: (meters/second)
%       right_weel_speed: (meters/second)
%   Output:
%       none
%   Examples:
%       s.setDriveSpeed(10) % Set both wheel speeds to 10 meters/second
%       s.setDriveSpeed(10, 20) % Set the left wheel speed to 10 and the
%                               % right wheel speed to 20 meters/second                                

    if nargin == 2
        right_wheel_speed = left_wheel_speed;
    elseif nargin < 2
        warning('Wheel speed required.');
        return
    end
    
    if ~isnumeric(left_wheel_speed) || ~isnumeric(right_wheel_speed)
        warning('Numeric wheel speeds required.');
        return
    end
    
%     this.drive_control_m.Command    = 'drive_raw_motors';
%     this.drive_control_m.LeftSpeed  = left_wheel_speed;
%     this.drive_control_m.RightSpeed = right_wheel_speed;


    args = sprintf('--command drive_raw_motors --left_speed %d --right_speed %d', ...
                   left_wheel_speed, right_wheel_speed);
    this.drive_control_m.Data = args;
    send(this.drive_control_pub, this.drive_control_m);
end