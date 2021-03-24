function resetHeading(this)
% RESETHEADING Reset the robots idea of "forward" to current direction
% 
%   The turnAngle function automatically does this. This is only needed if
%   the client is keeping and using an up-to-date estimation of the robots
%   heading.
%   Input:
%       none
%   Output:
%       none
%   Examples:
%       s.resetHeading() % Stops robot's movement

    this.drive_control_m.Command    = 'reset_heading';
    
    sendGoal(this.drive_control_ac, this.drive_control_m);
end

