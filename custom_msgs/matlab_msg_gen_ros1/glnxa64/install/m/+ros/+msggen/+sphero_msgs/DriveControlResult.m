
classdef DriveControlResult < ros.Message
    %DriveControlResult MATLAB implementation of sphero_msgs/DriveControlResult
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'sphero_msgs/DriveControlResult' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = '25458147911545c320c4c0a299eff763' % The MD5 Checksum of the message definition
        PropertyList = { 'Result' } % List of non-constant message properties
        ROSPropertyList = { 'result' } % List of non-constant ROS message properties
        PropertyMessageTypes = { '' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Result
    end
    methods
        function set.Result(obj, val)
            validClasses = {'numeric'};
            validAttributes = {'nonempty', 'scalar'};
            validateattributes(val, validClasses, validAttributes, 'DriveControlResult', 'Result');
            obj.Result = uint8(val);
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.sphero_msgs.DriveControlResult.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.sphero_msgs.DriveControlResult(strObj);
        end
    end
end
