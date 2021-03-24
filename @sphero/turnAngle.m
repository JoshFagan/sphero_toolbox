function turnAngle(this, angle)
% TURNANGLE Turn robot in place to angle specified in degrees.
%   Robot will turn in whichever direction will result in the shortest
%   path to the desired angle.
%   Input:
%       angle: (deg)
%   Output:
%       none
%   Examples:
%       s.turnAngle(-180) % rotate half turn clockwise

    if nargin ~= 2
        warning('Angle required to turn');
        return
    end

    if ~isnumeric(angle)
        warning('Angle must be a numeric value')
        return
    end

    this.drive_control_m.Command = 'turn_angle';
    this.drive_control_m.Angle = angle;

    sendGoal(this.drive_control_ac, this.drive_control_m);
end