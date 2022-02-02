function stop(this)
% STOP  Stop robot's forward or angular movement.
%   Input:
%       none
%   Output:
%       none
%   Examples:
%       s.stop() % Stops robot's movement

    % Send a command to stop as this stops the internal while loop on the
    % pi
    this.drive_control_m.Data = '--command stop';
    send(this.drive_control_pub, this.drive_control_m);
end
