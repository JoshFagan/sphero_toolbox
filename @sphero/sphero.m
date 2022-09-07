classdef sphero < handle
    % A MATLAB class file containing all necessary functions to communicate
    % with and control the RVR Sphero.
    %
    % SCROLL DOWN to Method Summary to see the list of commands
    %
    
    % this object is a subclass of the handle class so that all
    % modifications to the object are automatically saved with the object
    properties (Access=public)
        bot_id; % Alphanumeric ID of the bot
    end % Public properties
    
    properties (Access=private)
        pi_ip_address; % IP address of of Pi corresponding to bot ID
        pi_user;       % User name of Pi corresponding to bot ID
        pi_pass;       % Password of Pi corresponding to bot ID

        matlab_ip_address; % IP Address of local computer running MATLAB
        
        % ROS messages
        drive_control_m; % Message for drive control action client
        request_sphero_data_m;
        request_rpi_data_m;
        control_rpi_io_m;

        % ROS publishers
        drive_control_pub;
        request_rpi_data_pub;
        request_sphero_data_pub;
        control_rpi_io_pub;
        
        % ROS subscribers
        ambient_light_sub;
        distance_sub;
        color_detect_sub;
        position_sub;
        speed_sub;
        velocity_sub;
        imu_sub;
        image_sub;
        
        mypi;  % Connection to Raspberry Pi object
    end % Private properties
    
    properties (Access=private, Constant)
        NUM_TOPICS = 23; % Total number of ROS nodes that should be created
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
            pi_creds = readtable('bot_credentials.csv','ReadRowNames',true);

            try
                this.pi_ip_address = resolvehost(char(pi_creds.address(this.bot_id)) ,"address");
                this.pi_user = char(pi_creds.user(this.bot_id));
                this.pi_pass = char(pi_creds.password(this.bot_id));
            catch E
                error('Unrecognized robot ID');
            end
            
            % Get IP address of local computer running MATLAB 
            [~, hostname] = system('hostname');
            this.matlab_ip_address = resolvehost(strtrim(hostname), 'address');

            this.connect();

            disp( 'Finished creating Sphero object.' );
        end % Sphero constructor method

        setDriveSpeed(this, left_wheel_vel, right_wheel_vel)
        stop(this)
        turnAngle(this, degrees)
        resetHeading(this)
        wake(this)
        
        [light_level]       = getAmbientLight(this)
        [color, confidence] = getDetectedColor(this)
        [distance]          = getDistance(this)
        [position]          = getPosition(this)
        [velocity]          = getVelocity(this)
        [speed]             = getSpeed(this)
        [orientation]       = getOrientation(this)
        [angular_vel]       = getAngularVelocity(this)
        [acceleration]      = getAcceleration(this)
        [pi_image]          = getImage(this)
        []                  = setOLED(this, text, row, col)
    end % Public methods
    
    methods (Access=private)
        connect(this) % Connect to Sphero and start ROS server
        
        delete(this) % Terminate connection to Sphero and kill ROS server
    end % Private methods
end % Sphero class
