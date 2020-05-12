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
        bot_ip_addresses = {};  % List of IP addresses corresponding to botIDs
        matlab_ip_address = ''; % IP Address of local computer running MATLAB
        
        wheel_vel_pub = []; % ROS Publisher for wheel velocity topic
        relay_pub = [];     % Ros Publisher for relay input topic
        relay_sub = [];     % Ros Subscriber for relay output topic
        
        mypi = [];  % Connection to Raspberry Pi object
    end % Private properties
    
    properties (Access=private, Constant)
        NUM_TOPICS = 4; % Total number of topics that should be created
    end % Private, constant properties
    
    methods (Access=public)
        function this = sphero(varargin)
            % Create an object used to reference the RVR Sphero
            
            disp('Creating Sphero object.');
            
            % Define list of IP addresses
            % (should be updated when bots are connected to EF network)
            this.bot_ip_addresses{1} = '10.0.1.30';
            [~, num_bots] = size(this.bot_ip_addresses);
            
            % Input validation: expecting one integer greater than zero and
            % less than or equal to the number of bots            
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
        
        function connect(this)
            % Initialize communication with robot
                        
            this.init_pi();
            this.init_ros();
            this.init_topics();
            this.init_pubs_and_subs();
        end % Coonnect method
        
        function delete(this)
            % Class destructor, closes connection to Pi and terminates all running processes
            
            % Remove unneeded output file from Pi
            system( this.mypi, 'rm ~/launch_ros_nodes_output.txt -f' );
            
            % Restart Pi, terminating all processes being run on Pi
            try
                system( this.mypi, 'sudo shutdown -r now' );
            catch E
            end
            clear this.mypi;
            
            % Shutdown ROS master
            rosshutdown;
        end % Delete method
    end % Public methods
    
    methods (Access=private)
        function init_pi(this)
            % Create Pi object
            
            disp( 'Connecting to Pi.' );
            
            username   = 'pi';
            password  = 'raspberry';
            this.mypi = raspi(this.bot_ip_address, username, password);
            
            % Set ROS master uri on Pi to local IP address
            system(this.mypi, strcat( 'echo export ROS_MASTER_URI=http://', ...
                   this.matlab_ip_address, ':11311 > ~/sphero_toolbox/system_files/set_ros_master_uri.bash'));
            
            disp('Finished connecting to Pi.');
        end % Initialize pi method
        
        function init_ros(this)
            % Initialize ROS environment
            
            disp( 'Initializing ROS.' );
            
            % Make sure a ROS master node is not already running
            rosshutdown;
            
            % Iitialize new ROS master node
            setenv('ROS_MASTER_URI','http://localhost:11311');
            setenv('ROS_IP',this.matlab_ip_address);
            rosinit;
            
            disp( 'Finished initializing ROS.' );
        end % Initialize ROS method
        
        function init_topics(this)
            % Initialize ROS topics
            
            disp( 'Initializing ROS topics.' );
            
            % Launch ROS nodes on Pi
            system(this.mypi, ...
                   'roslaunch /home/pi/sphero_toolbox/catkin_ws/launch/sphero.launch > launch_ros_nodes_output.txt &');
            
            % Stall until topics have been created on Pi
            topics = rostopic('list');
            [num_topics, ~] = size(topics);
            while num_topics < this.NUM_TOPICS
                pause(0.5);
                topics = rostopic('list');
                [num_topics, ~] = size(topics);
            end
            
            disp( 'Finished initializing ROS topics.' );
        end % Initialize ROS topics method
        
        function init_pubs_and_subs(this)
            rostopic list
            % Initialize ROS publishers and subscribers to relevant topics
            disp( 'Initializing ROS publishers and subscribers.' );
            
            % Publish to wheel velocity topic
            this.wheel_vel_pub = rospublisher('/wheel_vel');
            % Publish to relay input topic
            this.relay_pub = rospublisher('/relay_in');
            
            % Subscribe to relay output topic
            this.relay_sub = rossubscriber( '/relay_out' );
            
            disp( 'Finished initializing ROS Publishers and Subscribers.' );
        end % Initialize ROS publishers and subscribers method
    end % Private methods
end % Sphero class

