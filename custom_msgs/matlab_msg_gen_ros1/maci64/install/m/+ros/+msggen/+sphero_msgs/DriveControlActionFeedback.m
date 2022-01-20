
classdef DriveControlActionFeedback < ros.Message
    %DriveControlActionFeedback MATLAB implementation of sphero_msgs/DriveControlActionFeedback
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'sphero_msgs/DriveControlActionFeedback' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = 'c141635549f044ad93f0f76d9f981cc7' % The MD5 Checksum of the message definition
        PropertyList = { 'Header' 'Status' 'Feedback' } % List of non-constant message properties
        ROSPropertyList = { 'header' 'status' 'feedback' } % List of non-constant ROS message properties
        PropertyMessageTypes = { 'ros.msggen.std_msgs.Header' ...
            'ros.msggen.actionlib_msgs.GoalStatus' ...
            'ros.msggen.sphero_msgs.DriveControlFeedback' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Header
        Status
        Feedback
    end
    methods
        function set.Header(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.std_msgs.Header'};
            validateattributes(val, validClasses, validAttributes, 'DriveControlActionFeedback', 'Header')
            obj.Header = val;
        end
        function set.Status(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.actionlib_msgs.GoalStatus'};
            validateattributes(val, validClasses, validAttributes, 'DriveControlActionFeedback', 'Status')
            obj.Status = val;
        end
        function set.Feedback(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.sphero_msgs.DriveControlFeedback'};
            validateattributes(val, validClasses, validAttributes, 'DriveControlActionFeedback', 'Feedback')
            obj.Feedback = val;
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.sphero_msgs.DriveControlActionFeedback.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.sphero_msgs.DriveControlActionFeedback(strObj);
        end
    end
end
