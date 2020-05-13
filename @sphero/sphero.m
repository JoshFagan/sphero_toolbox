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
        
        function setDriveVelocity(this, left_wheel_vel, right_wheel_vel)
            % Specify linear velocity of left wheel and right wheel
            
            % Set drive velocity of both wheels to single input value
            if nargin == 2
                message = [left_wheel_vel, left_wheel_vel];
            else
                message = [left_wheel_vel, right_wheel_vel];
            end
            
            this.publish_message(message, this.wheel_vel_pub);
        end % Set drive velocity function
        
        function relay_message(this, message)
            % Relay text message to Sphero
            
            this.publish_message(message, this.relay_pub); % Publish message
            
            relayed_message = receive(this.relay_sub); % Wait for responce from Sphero
            disp('Message relayed from Sphero:');
            disp(relayed_message.Data); 
        end
    end % Public methods
    
    methods (Access=private)
        connect(this) % Connect to Sphero and start ROS server

        function publish_message(this, message, topic)
            % Publish supplied message on specified topic
            
            msg = rosmessage(topic);
            msg.Data = message;
            send(topic,msg);
        end % Publish message function
    end % Private methods
end % Sphero class

