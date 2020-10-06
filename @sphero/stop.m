function stop(this)
    % Stop robot motors

    this.drive_control_m.Command = 'stop';

    sendGoal(this.drive_control_ac, this.drive_control_m);
end % Set drive velocity function