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
    end % nargin check
    
    this.drive_control_m.Command    = 'drive_raw_motors';
    this.drive_control_m.LeftSpeed  = left_wheel_speed;
    this.drive_control_m.RightSpeed = right_wheel_speed;

    sendGoal(this.drive_control_ac, this.drive_control_m);
end