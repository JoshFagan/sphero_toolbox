% Add Matlab generated message files to the static java class path
[class_dir, ~, ~] = fileparts(mfilename('fullpath'));

if ismac || isunix
    msg_path = sprintf( '%s/msg_gen/matlab_gen', pwd );
    cmd = sprintf('echo %s/msg_gen/matlab_gen/jar/sphero_msgs-0.0.0.jar >> ''%s/javaclasspath.txt''', class_dir, prefdir);
elseif ispc
    msg_path = sprintf( '%s\\msg_gen\\matlab_gen', pwd );
    cmd = sprintf('echo %s\\msg_gen\\matlab_gen\\jar\\sphero_msgs-0.0.0.jar >> ""%s/javaclasspath.txt""', class_dir, prefdir);
end

system(cmd);

% Add current directory to the path and save it
path(path, pwd);
path(path, msg_path);
savepath;

disp('Please restart Matlab for configuration to take effect.');
