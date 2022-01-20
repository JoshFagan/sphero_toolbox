function delete(this)
    % Class destructor, closes connection to Pi and terminates all running processes
    system( this.mypi, 'rosnode kill /rvr_control');
    pause(1)
    % Shutdown ROS master
    rosshutdown;
    
    % Remove unneeded output file from Pi
    if ~isempty(this.mypi)
        system( this.mypi, 'rm -f ~/.ros/log/*.log');
        system( this.mypi, 'rm -rf ~/.ros/log/*' );

        % Restart Pi, terminating all processes being run on Pi
        try
            system( this.mypi, 'sudo reboot +0.2' );
        catch E
        end
        clear this.mypi;
    end
end % Delete method
