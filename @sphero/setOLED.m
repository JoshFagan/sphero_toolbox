function [] = setOLED(this, text, row, col)
% SETDRIVESPEED Set the speed at which the robot's wheels move.
%   Input:
%       text: Text to display on OLED 
%       row: Row of OLED to set cursor on  
%       col: Col of OLED to set cursor on  
%   Output:
%       none
%   Examples:
%       s.setOLED('Hello World') % Set text at 0,0 to be "Hello World" 
%       s.setOLED('Hello World', 10, 20) % Set text at 10,20 to be "Hello World" 

    if nargin == 1 
        row = 0
        col = 0
    elseif nargin < 1
        warning('OLED text required.');
        return
    end

    if isnumeric(text) 
        error('String text required.');
        return
    end
    
    if ~isinteger(row) || ~isinteger(col)
        error('Numeric row and column values needed.');
        return
    end

    % TODO add more input validation for negative numbers
    
    args = sprintf('--device oled --text %s --row %d --col %d', ...
                   text, row, col);
    this.io_m.Data = args;
    send(this.control_rpi_io_pub, this.control_rpi_io_m);
end
