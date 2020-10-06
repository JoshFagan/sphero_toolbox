function setDriveVelocity(this, left_wheel_vel, right_wheel_vel)
    % Specify linear velocity of left wheel and right wheel

    % Set drive velocity of both wheels to single input value
    if nargin == 2
        right_wheel_vel = left_wheel_vel;
    end
    
    this.drive_control_m.Command    = 'drive_raw_motors';
    this.drive_control_m.LeftSpeed  = left_wheel_vel;
    this.drive_control_m.RightSpeed = right_wheel_vel;

    sendGoal(this.drive_control_ac, this.drive_control_m);
end % Set drive velocity function