
classdef DriveControlActionGoal < ros.Message
    %DriveControlActionGoal MATLAB implementation of sphero_msgs/DriveControlActionGoal
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'sphero_msgs/DriveControlActionGoal' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = '391929df59246ba79fab525354a59629' % The MD5 Checksum of the message definition
        PropertyList = { 'Header' 'GoalId' 'Goal' } % List of non-constant message properties
        ROSPropertyList = { 'header' 'goal_id' 'goal' } % List of non-constant ROS message properties
        PropertyMessageTypes = { 'ros.msggen.std_msgs.Header' ...
            'ros.msggen.actionlib_msgs.GoalID' ...
            'ros.msggen.sphero_msgs.DriveControlGoal' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Header
        GoalId
        Goal
    end
    methods
        function set.Header(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.std_msgs.Header'};
            validateattributes(val, validClasses, validAttributes, 'DriveControlActionGoal', 'Header')
            obj.Header = val;
        end
        function set.GoalId(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.actionlib_msgs.GoalID'};
            validateattributes(val, validClasses, validAttributes, 'DriveControlActionGoal', 'GoalId')
            obj.GoalId = val;
        end
        function set.Goal(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.sphero_msgs.DriveControlGoal'};
            validateattributes(val, validClasses, validAttributes, 'DriveControlActionGoal', 'Goal')
            obj.Goal = val;
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.sphero_msgs.DriveControlActionGoal.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.sphero_msgs.DriveControlActionGoal(strObj);
        end
    end
end
