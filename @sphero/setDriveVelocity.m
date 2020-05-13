function setDriveVelocity(this, left_wheel_vel, right_wheel_vel)
    % Specify linear velocity of left wheel and right wheel

    % Set drive velocity of both wheels to single input value
    if nargin == 2
        message = [left_wheel_vel, left_wheel_vel];
    else
        message = [left_wheel_vel, right_wheel_vel];
    end

    this.publish_message(message, this.wheel_vel_pub);
end % Set drive velocity function