% Add sphero_toolbox to path and save path
addpath('.');
savepath;

% Set python environemnt path
pyenv('Version','2.7');
% Add startup if on pc and space in userpath
if ispc && any(isspace(userpath))
    % Open startup.m file in default Documents/MATLAB
    fileID = fopen(fullfile(userpath,'startup.m'),'w');

    % Print setenv to make change persistent across MATLAB sessions
    envtext = "setenv('MY_PYTHON2_VENV', 'C:\Matlab_Python_Env')";
    fprintf(fileID,'%s',envtext);

    % Close file and run setenv so user doesn't need to restart
    fclose(fileID);
    setenv('MY_PYTHON2_VENV', 'C:\Matlab_Python_Env')
end
