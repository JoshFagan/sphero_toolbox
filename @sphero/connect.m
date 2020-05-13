function connect(this)
    % Initialize communication with robot

    init_pi(this);
    init_ros(this);
    init_topics(this);
    init_pubs_and_subs(this);
end % Coonnect method

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
    % Initialize ROS publishers and subscribers to relevant topics

    disp( 'Initializing ROS publishers and subscribers.' );

    % Publish to wheel velocity topic
    this.wheel_vel_pub = rospublisher('/wheel_vel');
    % Publish to relay input topic
    this.relay_pub = rospublisher('/relay_in');

    % Subscribe to relay output topic
    this.relay_sub = rossubscriber('/relay_out');

    disp( 'Finished initializing ROS Publishers and Subscribers.' );
end % Initialize ROS publishers and subscribers method