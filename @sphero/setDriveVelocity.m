function setDriveVelocity(this, left_wheel_vel, right_wheel_vel)
    % Specify linear velocity of left wheel and right wheel

    % Set drive velocity of both wheels to single input value
    if nargin == 2
        right_wheel_vel = left_wheel_vel;
    end
    
    m = rosmessage(strcat(this.raw_motor_ac.ActionType, 'Goal'));
    m.LeftSpeed  = left_wheel_vel;
    m.RightSpeed = right_wheel_vel;

    sendGoal(this.raw_motor_ac, m);
end % Set drive velocity function