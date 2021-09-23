function [data, info] = driveControlGoal
%DriveControlGoal gives an empty data for sphero_msgs/DriveControlGoal
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'sphero_msgs/DriveControlGoal';
[data.Command, info.Command] = ros.internal.ros.messages.ros.char('string',0);
[data.LeftSpeed, info.LeftSpeed] = ros.internal.ros.messages.ros.default_type('int16',1);
[data.RightSpeed, info.RightSpeed] = ros.internal.ros.messages.ros.default_type('int16',1);
[data.Angle, info.Angle] = ros.internal.ros.messages.ros.default_type('int16',1);
[data.Heading, info.Heading] = ros.internal.ros.messages.ros.default_type('int16',1);
[data.Time, info.Time] = ros.internal.ros.messages.ros.default_type('int16',1);
info.MessageType = 'sphero_msgs/DriveControlGoal';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,6);
info.MatPath{1} = 'command';
info.MatPath{2} = 'left_speed';
info.MatPath{3} = 'right_speed';
info.MatPath{4} = 'angle';
info.MatPath{5} = 'heading';
info.MatPath{6} = 'time';
