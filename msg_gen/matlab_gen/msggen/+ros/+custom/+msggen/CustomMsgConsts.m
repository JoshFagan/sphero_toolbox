classdef CustomMsgConsts
    %CustomMsgConsts This class stores all message types
    %   The message types are constant properties, which in turn resolve
    %   to the strings of the actual types.
    
    %   Copyright 2014-2020 The MathWorks, Inc.
    
    properties (Constant)
        drive_control_DriveRawMotorsAction = 'drive_control/DriveRawMotorsAction'
        drive_control_DriveRawMotorsActionFeedback = 'drive_control/DriveRawMotorsActionFeedback'
        drive_control_DriveRawMotorsActionGoal = 'drive_control/DriveRawMotorsActionGoal'
        drive_control_DriveRawMotorsActionResult = 'drive_control/DriveRawMotorsActionResult'
        drive_control_DriveRawMotorsFeedback = 'drive_control/DriveRawMotorsFeedback'
        drive_control_DriveRawMotorsGoal = 'drive_control/DriveRawMotorsGoal'
        drive_control_DriveRawMotorsResult = 'drive_control/DriveRawMotorsResult'
    end
    
    methods (Static, Hidden)
        function messageList = getMessageList
            %getMessageList Generate a cell array with all message types.
            %   The list will be sorted alphabetically.
            
            persistent msgList
            if isempty(msgList)
                msgList = cell(7, 1);
                msgList{1} = 'drive_control/DriveRawMotorsAction';
                msgList{2} = 'drive_control/DriveRawMotorsActionFeedback';
                msgList{3} = 'drive_control/DriveRawMotorsActionGoal';
                msgList{4} = 'drive_control/DriveRawMotorsActionResult';
                msgList{5} = 'drive_control/DriveRawMotorsFeedback';
                msgList{6} = 'drive_control/DriveRawMotorsGoal';
                msgList{7} = 'drive_control/DriveRawMotorsResult';
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
                actList{1} = 'drive_control/DriveRawMotors';
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            actionList = actList;
        end
    end
end
