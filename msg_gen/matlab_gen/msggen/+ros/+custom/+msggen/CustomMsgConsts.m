classdef CustomMsgConsts
    %CustomMsgConsts This class stores all message types
    %   The message types are constant properties, which in turn resolve
    %   to the strings of the actual types.
    
    %   Copyright 2014-2020 The MathWorks, Inc.
    
    properties (Constant)
        sphero_msgs_DriveRawMotorsAction = 'sphero_msgs/DriveRawMotorsAction'
        sphero_msgs_DriveRawMotorsActionFeedback = 'sphero_msgs/DriveRawMotorsActionFeedback'
        sphero_msgs_DriveRawMotorsActionGoal = 'sphero_msgs/DriveRawMotorsActionGoal'
        sphero_msgs_DriveRawMotorsActionResult = 'sphero_msgs/DriveRawMotorsActionResult'
        sphero_msgs_DriveRawMotorsFeedback = 'sphero_msgs/DriveRawMotorsFeedback'
        sphero_msgs_DriveRawMotorsGoal = 'sphero_msgs/DriveRawMotorsGoal'
        sphero_msgs_DriveRawMotorsResult = 'sphero_msgs/DriveRawMotorsResult'
    end
    
    methods (Static, Hidden)
        function messageList = getMessageList
            %getMessageList Generate a cell array with all message types.
            %   The list will be sorted alphabetically.
            
            persistent msgList
            if isempty(msgList)
                msgList = cell(7, 1);
                msgList{1} = 'sphero_msgs/DriveRawMotorsAction';
                msgList{2} = 'sphero_msgs/DriveRawMotorsActionFeedback';
                msgList{3} = 'sphero_msgs/DriveRawMotorsActionGoal';
                msgList{4} = 'sphero_msgs/DriveRawMotorsActionResult';
                msgList{5} = 'sphero_msgs/DriveRawMotorsFeedback';
                msgList{6} = 'sphero_msgs/DriveRawMotorsGoal';
                msgList{7} = 'sphero_msgs/DriveRawMotorsResult';
            end
            
            messageList = msgList;
        end
        
        function serviceList = getServiceList
            %getServiceList Generate a cell array with all service types.
            %   The list will be sorted alphabetically.
            
            persistent svcList
            if isempty(svcList)
                svcList = cell(0, 1);
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            serviceList = svcList;
        end
        
        function actionList = getActionList
            %getActionList Generate a cell array with all action types.
            %   The list will be sorted alphabetically.
            
            persistent actList
            if isempty(actList)
                actList = cell(1, 1);
                actList{1} = 'sphero_msgs/DriveRawMotors';
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            actionList = actList;
        end
    end
end
