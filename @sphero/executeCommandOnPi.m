function [command_output] = executeCommandOnPi(this, command)
% EXECUTECOMMANDONPI  Execute a specified command on the Raspberry pi that
% is connected to the Sphero RVR.
%   Input:
%       command: A string of the command to be executed on the Pi.
%   Output:
%       command_output: Output from performing the supplied command on the
%       Pi.
%   Examples:
%       s.executeCommandOnPi('ls') % Performs the "ls" command on the pi,
%       returning the contents of the home directory

    command_output = system(this.mypi, command);
end