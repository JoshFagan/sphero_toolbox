% Add sphero_toolbox to path and save path
addpath('.');
savepath;

% Set python environemnt path
pyenv('Version','2.7');
if ispc
    setenv('MY_PYTHON2_VENV', 'C:\Matlab_Python_Env') 
end
