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
    send(this.drive_control_pub, this.drive_control_m);
end
