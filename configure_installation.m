% Add current directory to the path and save it
path(path, pwd);
path(path, genpath(sprintf( '%s/msg_gen/matlab_gen', pwd )))
savepath;

% Add Matlab generated message files to the static java class path
[class_dir, ~, ~] = fileparts(mfilename('fullpath'));
cmd = sprintf('echo %s/msg_gen/matlab_gen/jar/sphero_msgs-0.0.0.jar >> ''%s/javaclasspath.txt''', class_dir, prefdir);
system(cmd);

disp('Please restart Matlab for configuration to take effect.');
