classdef sphero < handle
    % A MATLAB class file containing all necessary functions to communicate
    % with and control the RVR Sphero.
    %
    % SCROLL DOWN to Method Summary to see the list of commands
    %
    
    % this object is a subclass of the handle class so that all
    % modifications to the object are automatically saved with the object
    properties (Access=public)
        bot_id = 0; % numeric ID of the bot
    end % Public properties
    
    properties (Access=private)
        bot_ip_address = '';    % IP address of robot with specified ID
        % List of IP addresses corresponding to botIDs
        % (should be updated when bots are connected to EF network)
        bot_ip_addresses = {'10.0.1.30'}; 
        matlab_ip_address = ''; % IP Address of local computer running MATLAB

        % ROS action clients
        raw_motor_ac = [];  % Action client for driving raw motors
        
        % ROS subscribers
        ambient_light_sub = [];
        color_detect_sub  = [];
        position_sub      = [];
        speed_sub         = [];
        velocity_sub      = [];
        imu_sub           = [];
        
        % Misc ROS properties
        rate = 4;   % Frequency of communications in Hz
        
        mypi = [];  % Connection to Raspberry Pi object
    end % Private properties
    
    properties (Access=private, Constant)
        NUM_TOPICS = 12; % Total number of topics that should be created
    end % Private, constant properties
    
    methods (Access=public)
        function this = sphero(varargin)
            % s = SPHERO(robot_id) Create an object used to reference the RVR Sphero
            
            disp('Creating Sphero object.');            
            
            % Input validation: expecting one integer greater than zero and
            % less than or equal to the number of bots   
            [~, num_bots] = size(this.bot_ip_addresses);
            if nargin ~= 1 || ~isnumeric(varargin{1})
                error( 'Please supply one integer as robot ID' );
            elseif varargin{1} < 1 || varargin{1} > num_bots
                error('Robot ID not recognized')
            end
            
            this.bot_id = varargin{1};
            this.bot_ip_address = this.bot_ip_addresses{this.bot_id};
            
            % Get IP address of local computer running MATLAB 
            % (command works for Macs, not tested on other systems)
            [~, ip_addess] = system('ipconfig getifaddr en1');
            this.matlab_ip_address = strtrim(ip_addess);
                        
            this.connect();
            
            disp( 'Finished creating Sphero object.' );
        end % Sphero constructor method
        
        setDriveVelocity(this, left_wheel_vel, right_wheel_vel)
        
        [light_level]       = getAmbientLight(this)
        [color, confidence] = getDetectedColor(this)
        [position]          = getPosition(this)
        [velocity]          = getVelocity(this)
        [speed]             = getSpeed(this)
        [orientation]       = getOrientation(this)
        [angular_vel]       = getAngularVelocity(this)
        [acceleration]      = getAcceleration(this)
    end % Public methods
    
    methods (Access=private)
        connect(this) % Connect to Sphero and start ROS server
        
        delete(this) % Terminate connection to Sphero and kill ROS server
    end % Private methods
    
    methods (Access=private, Static)
        publishMessage(message, topic)
    end % Private, static methods
end % Sphero class
