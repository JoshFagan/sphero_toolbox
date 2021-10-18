function stop(this)
% STOP  Stop robot's forward or angular movement.
%   Input:
%       none
%   Output:
%       none
%   Examples:
%       s.stop() % Stops robot's movement

    % Send a command to set speed to zero as this stops the robot the
    % fastest
    this.drive_control_m.Command    = 'drive_raw_motors';
    this.drive_control_m.LeftSpeed  = 0;
    this.drive_control_m.RightSpeed = 0;
    sendGoal(this.drive_control_ac, this.drive_control_m);
    pause(0.5)

    % Send a command to stop as this stops the internal while loop on the
    % pi
    this.drive_control_m.Command = 'stop';
    sendGoal(this.drive_control_ac, this.drive_control_m);
end
