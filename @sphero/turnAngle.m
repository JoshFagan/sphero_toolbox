function turnAngle(this, angle)
% TURNANGLE Turn robot in place to angle specified in degrees.
%
%   Robot will turn in whichever direction will result in the shortest
%   path to the desired angle.
%   Input:
%       angle: (deg)
%   Output:
%       none
%   Examples:
%       s.turnAngle(-180) % rotate half of a full rotation

    if nargin ~= 2
        warning('Angle required to turn');
        return
    end

    if ~isnumeric(angle)
        warning('Angle must be a numeric value')
        return
    end

    args = sprintf('--command turn_angle --angle %d', angle);
    this.drive_control_m.Data = args;

    % Check to see if backend service topics have been created
    try
        rostopic('info', '/matlab_interface/drive_command');
    catch E
        warning('Cannot execute command "turnAngle" as the drive control systems are not online yet.')
    end

    % Check to see if MATLAB interface topics have been subscribed to          
    if isempty(rostopic('info', '/matlab_interface/drive_command').Subscribers)
        warning('Cannot execute command "turnAngle" as the drive control systems are not online yet.')
    else
        send(this.drive_control_pub, this.drive_control_m);
    end
end
