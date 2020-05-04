classdef sphero < handle
    % A MATLAB class file containing all necessary functions to communicate
    % with and control the RVR Sphero.
    %
    % SCROLL DOWN to Method Summary to see the list of commands
    %
    
    % this object is a subclass of the handle class so that all
    % modifications to the object are automatically saved with the object
    properties (Access=public)
        bot_id = 0;              % numeric ID of the bot
        bot_ip_address = '';
        %bot_ip_addresses = {};  % List of IP addresses corresponding to botIDs
        matlab_ip_address = '';  % IP Address of local computer running MATLAB
    end % public properties
    
    properties (Access=private)
        bot_ip_addresses = {};  % List of IP addresses corresponding to botIDs
    end % private properties
    
    methods (Access=public)
        function this = sphero(varargin)
            % Create an object used to reference the RVR Sphero
            
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
        end
        
        function connect(this)
            % Initialize communication with robot

            rosshutdown; % Make sure a ROS master node is not already running
            
            % Iitialize new ROS master node
            setenv('ROS_MASTER_URI','http://localhost:11311');
            setenv('ROS_IP',this.matlab_ip_address);
            rosinit

            % Create Pi object
            username   = 'pi';
            password  = 'raspberry';
            mypi = raspi( this.bot_ip_address, username, password );
            
            % Set ROS environment variables on Pi
            sys_cmd = strcat('export ROS_MASTER_URI=http://', ...
                             this.matlab_ip_address, ':11311/; ', ...
                             'export ROS_IP=', this.bot_ip_address);
            system( mypi, sys_cmd )
        end
    end
end

