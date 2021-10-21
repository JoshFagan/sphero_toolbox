classdef sphero < handle
    % A MATLAB class file containing all necessary functions to communicate
    % with and control the RVR Sphero.
    %
    % SCROLL DOWN to Method Summary to see the list of commands
    %
    
    % this object is a subclass of the handle class so that all
    % modifications to the object are automatically saved with the object
    properties (Access=public)
        bot_id = ''; % Alphanumeric ID of the bot
    end % Public properties
    
    properties (Access=private)
        bot_ip_address = '';    % IP address of robot with specified ID
        % List of IP addresses corresponding to botIDs
        bot_ip_addresses = struct('RV_1A61', '192.168.1.202', ...
                                  'RV_CE62', '192.168.1.201', ...
                                  'RV_A799', '192.168.1.203', ...
                                  'RV_2D57', '192.168.1.205', ...
                                  'RV_7457', '192.168.1.206', ...
                                  'RV_68DA', '192.168.1.204', ...
                                  'RV_3AC5', '192.168.1.208', ...
                                  'RV_8C53', '192.168.1.207', ...
                                  'RV_18D7', '192.168.1.209', ...
                                  'RV_961B', '192.168.1.210', ...
                                  'RV_B22D', '192.168.1.211', ...
                                  'RV_D762', '192.168.1.212', ...
                                  'RV_148E', '192.168.1.213', ...
                                  'RV_ADE7', '192.168.1.214', ...
                                  'RV_1BCE', '192.168.1.216', ...
                                  'RV_13F4', '192.168.1.217', ...
                                  'RV_E9A6', '192.168.1.215', ...
                                  'RV_0279', '192.168.1.218', ...
                                  'RV_A208', '192.168.1.219', ...
                                  'RV_D967', '192.168.1.220', ...
                                  'RV_887D', '192.168.1.221', ...
                                  'RV_2738', '192.168.1.222', ...
                                  'RV_8C66', '192.168.1.223', ...
                                  'RV_874F', '192.168.1.224', ...
                                  'RV_282C', '192.168.1.225', ...
                                  'RV_3530', '192.168.1.227', ...
                                  'RV_8874', '192.168.1.228', ...
                                  'RV_E84A', '192.168.1.229', ...
                                  'RV_AB60', '192.168.1.226', ...
                                  'RV_C9F2', '192.168.1.241', ...
                                  'RV_83BA', '192.168.1.242'); % IP for EFD Roomba Linksys
        matlab_ip_address = ''; % IP Address of local computer running MATLAB

        % ROS action clients
        drive_control_ac = [];  % Action client for driving raw motors
        
        % ROS messages
        drive_control_m = []; % Message for drive control action client
        
        % ROS subscribers
        ambient_light_sub = [];
        color_detect_sub  = [];
        position_sub      = [];
        speed_sub         = [];
        velocity_sub      = [];
        imu_sub           = [];
        image_sub         = [];
        
        % Misc ROS properties
        rate = 4;   % Frequency of communications in Hz
        
        mypi;  % Connection to Raspberry Pi object
    end % Private properties
    
    properties (Access=private, Constant)
        NUM_TOPICS = 13; % Total number of topics that should be created
    end % Private, constant properties
    
    methods (Access=public)
        function this = sphero(varargin)
            % s = SPHERO(robot_id) Create an object used to reference the RVR Sphero
            
            disp('Creating Sphero object.');            
            
            % Input validation: expecting one integer greater than zero and
            % less than or equal to the number of bots   
            if nargin ~= 1
                error('Please supply one robot ID');
            end
            
            this.bot_id = varargin{1};
            this.bot_id(this.bot_id == '-') = '_';

            try
                this.bot_ip_address = this.bot_ip_addresses.(this.bot_id);
            catch E
                error('Unrecognized robot ID');
            end
            
            % Get IP address of local computer running MATLAB 
            % (command works for Macs, not tested on other systems)
            if ismac || ispc
                [~, ip_address] = system('curl -s http://checkip.dyndns.org/');
                ip_address = split(ip_address,':');
                ip_address = split(ip_address{2}, '<');
                ip_address = ip_address{1};
            else
                [~, ip_address] = system('hostname -I');
            end
            this.matlab_ip_address = strtrim(ip_address);

            this.connect();

            disp( 'Finished creating Sphero object.' );
        end % Sphero constructor method

        setDriveSpeed(this, left_wheel_vel, right_wheel_vel)
        stop(this)
        turnAngle(this, degrees)
        resetHeading(this)
        
        [light_level]       = getAmbientLight(this)
        [color, confidence] = getDetectedColor(this)
        [position]          = getPosition(this)
        [velocity]          = getVelocity(this)
        [speed]             = getSpeed(this)
        [orientation]       = getOrientation(this)
        [angular_vel]       = getAngularVelocity(this)
        [acceleration]      = getAcceleration(this)
        [pi_image]             = getImage(this)
    end % Public methods
    
    methods (Access=private)
        connect(this) % Connect to Sphero and start ROS server
        
        delete(this) % Terminate connection to Sphero and kill ROS server
    end % Private methods
end % Sphero class
