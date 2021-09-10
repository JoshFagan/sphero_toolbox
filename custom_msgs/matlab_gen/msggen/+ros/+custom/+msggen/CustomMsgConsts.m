classdef CustomMsgConsts
    %CustomMsgConsts This class stores all message types
    %   The message types are constant properties, which in turn resolve
    %   to the strings of the actual types.
    
    %   Copyright 2014-2021 The MathWorks, Inc.
    
    properties (Constant)
        sphero_msgs_DriveControlAction = 'sphero_msgs/DriveControlAction'
        sphero_msgs_DriveControlActionFeedback = 'sphero_msgs/DriveControlActionFeedback'
        sphero_msgs_DriveControlActionGoal = 'sphero_msgs/DriveControlActionGoal'
        sphero_msgs_DriveControlActionResult = 'sphero_msgs/DriveControlActionResult'
        sphero_msgs_DriveControlFeedback = 'sphero_msgs/DriveControlFeedback'
        sphero_msgs_DriveControlGoal = 'sphero_msgs/DriveControlGoal'
        sphero_msgs_DriveControlResult = 'sphero_msgs/DriveControlResult'
    end
    
    methods (Static, Hidden)
        function messageList = getMessageList
            %getMessageList Generate a cell array with all message types.
            %   The list will be sorted alphabetically.
            
            persistent msgList
            if isempty(msgList)
                msgList = cell(7, 1);
                msgList{1} = 'sphero_msgs/DriveControlAction';
                msgList{2} = 'sphero_msgs/DriveControlActionFeedback';
                msgList{3} = 'sphero_msgs/DriveControlActionGoal';
                msgList{4} = 'sphero_msgs/DriveControlActionResult';
                msgList{5} = 'sphero_msgs/DriveControlFeedback';
                msgList{6} = 'sphero_msgs/DriveControlGoal';
                msgList{7} = 'sphero_msgs/DriveControlResult';
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
                actList{1} = 'sphero_msgs/DriveControl';
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            actionList = actList;
        end
    end
end
