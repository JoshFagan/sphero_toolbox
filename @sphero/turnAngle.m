function turnAngle(this, degrees)
    % Turn degrees specified
    % Positive degrees turns clockwise, negaive degrees turns counter-clockwise
    
    this.drive_control_m.Command = 'turn_angle';
    this.drive_control_m.Degrees = degrees;

    sendGoal(this.drive_control_ac, this.drive_control_m);
end % Set drive velocity function