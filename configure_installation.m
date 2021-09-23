% Add Matlab generated message files to the path
if ismac || isunix
    msg_path = sprintf( '%s/custom_msgs/matlab_msg_gen_ros1/glnxa64/install/m', pwd );
elseif ispc
    msg_path = sprintf( '%s\\custom_msgs\\matlab_msg_gen_ros1\\glnxa64\\install\\m', pwd );
end

%system(cmd);

% Add current directory to the path and save it
addpath(pwd);
addpath(msg_path);
savepath;
clear classes;
rehash toolboxcache;