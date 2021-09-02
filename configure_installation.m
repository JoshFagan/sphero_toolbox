% Add Matlab generated message files to the static java class path
%[class_dir, ~, ~] = fileparts(mfilename('fullpath'));

if ismac || isunix
    msg_path = sprintf( '%s/custom_msgs/matlab_msg_gen_ros1/glnxa64/install/m', pwd );
    %msg_path = sprintf( '%s/msg_gen/matlab_gen', pwd );
    %cmd = sprintf('echo %s/msg_gen/matlab_gen/jar/sphero_msgs-0.0.0.jar >> ''%s/javaclasspath.txt''', class_dir, prefdir);
elseif ispc
    msg_path = sprintf( '%s\\custom_msgs\\matlab_msg_gen_ros1\\glnxa64\\install\\m', pwd );
    %msg_path = sprintf( '%s\\msg_gen\\matlab_gen', pwd );
    %cmd = sprintf('echo %s\\msg_gen\\matlab_gen\\jar\\sphero_msgs-0.0.0.jar >> ""%s/javaclasspath.txt""', class_dir, prefdir);
end

%system(cmd);

% Add current directory to the path and save it
addpath(pwd);
%path(path, msg_path);
addpath(msg_path);
savepath;
clear classes;
rehash toolboxcache;

%disp('Please restart Matlab for configuration to take effect.');
