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

    % Cap wheel speed at 100
    left_wheel_speed = min(left_wheel_speed, 100);
    right_wheel_speed = min(right_wheel_speed, 100);
    left_wheel_speed = max(left_wheel_speed, -100);
    right_wheel_speed = max(right_wheel_speed, -100);

    args = sprintf('--command drive_raw_motors --left_speed %d --right_speed %d', ...
                   left_wheel_speed, right_wheel_speed);
    this.drive_control_m.Data = args;

    % Check to see if backend service topics have been created
    try
        rostopic('info', '/matlab_interface/drive_command');
    catch E
        warning('Cannot execute command "setDriveSpeed" as the drive control systems are not online yet.')
    end

    % Check to see if matlab interface topics have been subscribed to          
    if isempty(rostopic('info', '/matlab_interface/drive_command').Subscribers)
        warning('Cannot execute command "setDriveSpeed" as the drive control systems are not online yet.')
    else
        send(this.drive_control_pub, this.drive_control_m);
    end
end