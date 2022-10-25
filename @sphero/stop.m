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

    % Check to see if backend service topics have been created
    try
        rostopic('info', '/matlab_interface/drive_command');
    catch E
        warning('Cannot execute command "stop" as the drive control systems are not online yet.')
    end

    % Check to see if matlab interface topics have been subscribed to          
    if isempty(rostopic('info', '/matlab_interface/drive_command').Subscribers)
        warning('Cannot execute command "stop" as the drive control systems are not online yet.')
    else
        send(this.drive_control_pub, this.drive_control_m);
    end
end
