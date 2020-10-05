classdef CustomMsgConsts
    %CustomMsgConsts This class stores all message types
    %   The message types are constant properties, which in turn resolve
    %   to the strings of the actual types.
    
    %   Copyright 2014-2020 The MathWorks, Inc.
    
    properties (Constant)
        sphero_msgs_DriveControlAction = 'sphero_msgs/DriveControlAction'
        sphero_msgs_DriveControlActionFeedback = 'sphero_msgs/DriveControlActionFeedback'
        sphero_msgs_DriveControlActionGoal = 'sphero_msgs/DriveControlActionGoal'
        sphero_msgs_DriveControlActionResult = 'sphero_msgs/DriveControlActionResult'
        sphero_msgs_DriveControlFeedback = 'sphero_msgs/DriveControlFeedback'
        sphero_msgs_DriveControlGoal = 'sphero_msgs/DriveControlGoal'
        sphero_msgs_DriveControlResult = 'sphero_msgs/DriveControlResult'
        sphero_msgs_DriveRawMotorsAction = 'sphero_msgs/DriveRawMotorsAction'
        sphero_msgs_DriveRawMotorsActionFeedback = 'sphero_msgs/DriveRawMotorsActionFeedback'
        sphero_msgs_DriveRawMotorsActionGoal = 'sphero_msgs/DriveRawMotorsActionGoal'
        sphero_msgs_DriveRawMotorsActionResult = 'sphero_msgs/DriveRawMotorsActionResult'
        sphero_msgs_DriveRawMotorsFeedback = 'sphero_msgs/DriveRawMotorsFeedback'
        sphero_msgs_DriveRawMotorsGoal = 'sphero_msgs/DriveRawMotorsGoal'
        sphero_msgs_DriveRawMotorsResult = 'sphero_msgs/DriveRawMotorsResult'
        sphero_msgs_TurnAngleAction = 'sphero_msgs/TurnAngleAction'
        sphero_msgs_TurnAngleActionFeedback = 'sphero_msgs/TurnAngleActionFeedback'
        sphero_msgs_TurnAngleActionGoal = 'sphero_msgs/TurnAngleActionGoal'
        sphero_msgs_TurnAngleActionResult = 'sphero_msgs/TurnAngleActionResult'
        sphero_msgs_TurnAngleFeedback = 'sphero_msgs/TurnAngleFeedback'
        sphero_msgs_TurnAngleGoal = 'sphero_msgs/TurnAngleGoal'
        sphero_msgs_TurnAngleResult = 'sphero_msgs/TurnAngleResult'
    end
    
    methods (Static, Hidden)
        function messageList = getMessageList
            %getMessageList Generate a cell array with all message types.
            %   The list will be sorted alphabetically.
            
            persistent msgList
            if isempty(msgList)
                msgList = cell(21, 1);
                msgList{1} = 'sphero_msgs/DriveControlAction';
                msgList{2} = 'sphero_msgs/DriveControlActionFeedback';
                msgList{3} = 'sphero_msgs/DriveControlActionGoal';
                msgList{4} = 'sphero_msgs/DriveControlActionResult';
                msgList{5} = 'sphero_msgs/DriveControlFeedback';
                msgList{6} = 'sphero_msgs/DriveControlGoal';
                msgList{7} = 'sphero_msgs/DriveControlResult';
                msgList{8} = 'sphero_msgs/DriveRawMotorsAction';
                msgList{9} = 'sphero_msgs/DriveRawMotorsActionFeedback';
                msgList{10} = 'sphero_msgs/DriveRawMotorsActionGoal';
                msgList{11} = 'sphero_msgs/DriveRawMotorsActionResult';
                msgList{12} = 'sphero_msgs/DriveRawMotorsFeedback';
                msgList{13} = 'sphero_msgs/DriveRawMotorsGoal';
                msgList{14} = 'sphero_msgs/DriveRawMotorsResult';
                msgList{15} = 'sphero_msgs/TurnAngleAction';
                msgList{16} = 'sphero_msgs/TurnAngleActionFeedback';
                msgList{17} = 'sphero_msgs/TurnAngleActionGoal';
                msgList{18} = 'sphero_msgs/TurnAngleActionResult';
                msgList{19} = 'sphero_msgs/TurnAngleFeedback';
                msgList{20} = 'sphero_msgs/TurnAngleGoal';
                msgList{21} = 'sphero_msgs/TurnAngleResult';
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
                actList = cell(3, 1);
                actList{1} = 'sphero_msgs/DriveControl';
                actList{2} = 'sphero_msgs/DriveRawMotors';
                actList{3} = 'sphero_msgs/TurnAngle';
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            actionList = actList;
        end
    end
end
