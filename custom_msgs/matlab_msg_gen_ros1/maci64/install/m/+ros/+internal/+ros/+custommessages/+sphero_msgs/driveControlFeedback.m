function [data, info] = driveControlFeedback
%DriveControlFeedback gives an empty data for sphero_msgs/DriveControlFeedback
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'sphero_msgs/DriveControlFeedback';
[data.Feedback, info.Feedback] = ros.internal.ros.messages.ros.default_type('uint8',1);
info.MessageType = 'sphero_msgs/DriveControlFeedback';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'feedback';
