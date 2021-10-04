% Generate custom ROS message files
rosgenmsg('custom_msgs', 'BuildConfiguration', 'fasterruns');

% Add current directory and custom message paths to the search path and save it
if ismac
    msg_path = sprintf( '%s/custom_msgs/matlab_msg_gen_ros1/maci64/install/m', pwd );
elseif ispc
    msg_path = sprintf( '%s\\custom_msgs\\matlab_msg_gen_ros1\\maci64\\install\\m', pwd );
else
    msg_path = sprintf( '%s/custom_msgs/matlab_msg_gen_ros1/glnxa64/install/m', pwd );
end

addpath(pwd);
addpath(msg_path);
savepath;

% Perfrom custom message refresh
clear classes;
rehash toolboxcache;