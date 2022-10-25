function wake(this)
% WAKE Wake Sphero RVR up from a soft sleep. 
%   Input:
%       none
%   Output:
%       none
%   Examples:
%       s.wake() % Wakes robot up from soft sleep 

    % Send a command to wake up robot from soft sleep 
    this.drive_control_m.Data = '--command wake';

    % Check to see if backend service topics have been created
    try
        rostopic('info', '/matlab_interface/drive_command');
    catch E
        warning('Cannot execute command "wake" as the drive control systems are not online yet.')
    end

    % Check to see if matlab interface topics have been subscribed to          
    if isempty(rostopic('info', '/matlab_interface/drive_command').Subscribers)
        warning('Cannot execute command "wake" as the drive control systems are not online yet.')
    else
        send(this.drive_control_pub, this.drive_control_m);
    end
end
