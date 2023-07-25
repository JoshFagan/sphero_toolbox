function connect(this)
    % Initialize communication with robot
    init_pi(this);
    init_ros(this);
    init_matlab_communicators(this);
    init_pi_communicators(this);
end % Coonnect method

function init_pi(this)
    % Create Pi object
    disp('Connecting to Pi.');
    disp('This can take 1-2 minutes.');

    this.mypi = raspi(this.pi_ip_address, this.pi_user, this.pi_pass);

    % Set ROS master uri on Pi to local IP address
    system(this.mypi, strcat('echo export ROS_MASTER_URI=http://', ...
           this.matlab_ip_address, ':11311 > ~/sphero_toolbox/system_files/set_ros_master_uri.bash'));
    % Set ROS IP on Pi to Pi IP address
    system(this.mypi, strcat('echo export ROS_IP=', ...
           this.pi_ip_address, ' >> ~/sphero_toolbox/system_files/set_ros_master_uri.bash'));
    
    disp('Finished connecting to Pi.');
end % Initialize pi method

function init_ros(this)
    % Initialize ROS environment
    disp('Initializing MATLAB ROS host.');
    disp('This should take less than 1 minute.');

    % Make sure a ROS master node is not already running
    %rosshutdown;

    % Iitialize new ROS master node
    setenv('ROS_MASTER_URI','http://localhost:11311');
    setenv('ROS_IP',this.matlab_ip_address);
    try
        rosinit;
    catch E
    end

    disp('Finished initializing MATLAB ROS host.');
end % Initialize ROS method

function init_matlab_communicators(this)
    % Initialize ROS publishers, and subscribers in MATLAB
    disp('Initializing MATLAB ROS communicators.');
    disp('This should take less than 1 minute.');

    % ROS publishers
    [this.drive_control_pub, this.drive_control_m] = rospublisher('/matlab_interface/drive_command', ...
                                                                  'std_msgs/String');
    [this.request_rpi_data_pub, this.request_rpi_data_m] = rospublisher('/rpi_sensors/request_data', ...
                                                                        'std_msgs/String');
    [this.request_sphero_data_pub, this.request_sphero_data_m] = rospublisher('/sphero_sensors/request_data', ...
                                                                              'std_msgs/String');
    [this.control_rpi_io_pub, this.control_rpi_io_m] = rospublisher('/matlab_interface/rpi_io', ...
                                                                    'std_msgs/String');

    % ROS subscribers
    this.distance_sub      = rossubscriber('/rpi_sensors/distance', ...
                                           'std_msgs/Float64');
    this.image_sub         = rossubscriber('/rpi_sensors/image/compressed', ...
                                           'sensor_msgs/CompressedImage');
    this.color_detect_sub  = rossubscriber('/sphero_sensors/color_detected', ...
                                           'std_msgs/ColorRGBA');
    this.ambient_light_sub = rossubscriber('/sphero_sensors/ambient_light', ...
                                           'std_msgs/Float64');
    this.position_sub      = rossubscriber('/sphero_sensors/position', ...
                                           'geometry_msgs/Vector3');
    this.velocity_sub      = rossubscriber('/sphero_sensors/velocity', ...
                                           'geometry_msgs/Vector3');
    this.speed_sub         = rossubscriber('/sphero_sensors/speed', ...
                                           'std_msgs/Float64');
    this.imu_sub           = rossubscriber('/sphero_sensors/imu', ...
                                           'sensor_msgs/Imu');

    disp('Finished initializing MATLAB ROS communicators.');
end % Initialize ROS communicators in MATLAB function 

function init_pi_communicators(this)
    % Initialize ROS action servers, publishers, and subscribers on the Pi
    disp('Initializing Raspberry Pi ROS communicators.');
    disp('This can take 1-2 minutes.');

    % Launch ROS nodes on Pi
    system(this.mypi, ...
           'source ~/sphero_toolbox/system_files/set_ros_master_uri.bash; roslaunch --log /home/pi/sphero_toolbox/catkin_ws/launch/sphero.launch > .ros/log/temp.log &');

    disp('Finished initializing Raspberry Pi ROS communicators.');
end % Initialize ROS communicators in Pi function 
