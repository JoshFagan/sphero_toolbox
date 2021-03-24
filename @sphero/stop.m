function stop(this)
% STOP  Stop robot's forward or angular movement.
%   Input:
%       none
%   Output:
%       none
%   Examples:
%       s.stop() % Stops robot's movement

    this.drive_control_m.Command = 'stop';

    sendGoal(this.drive_control_ac, this.drive_control_m);
end