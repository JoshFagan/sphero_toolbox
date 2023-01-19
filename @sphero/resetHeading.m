function resetHeading(this)
% RESETHEADING Reset the robots idea of "forward" to current direction.
% 
%   The turnAngle function automatically does this. This is only needed if
%   the client is keeping and using an up-to-date estimation of the robot's
%   heading.
%   Input:
%       none
%   Output:
%       none
%   Examples:
%       s.resetHeading()

    this.drive_control_m.Data = '--command reset_heading';

    % Check to see if backend service topics have been created
    try
        rostopic('info', '/matlab_interface/drive_command');
    catch E
        warning('Cannot execute command "resetHeading" as the drive control systems are not online yet.')
    end

    % Check to see if matlab interface topics have been subscribed to          
    if isempty(rostopic('info', '/matlab_interface/drive_command').Subscribers)
        warning('Cannot execute command "resetHeading" as the drive control systems are not online yet.')
    else
        send(this.drive_control_pub, this.drive_control_m);
    end
end

