function delete(this)
    % Class destructor, closes connection to Pi and terminates all running processes
    % Shutdown ROS master
    rosshutdown;
    
    % Remove unneeded output file from Pi
    if ~isempty(this.mypi)
        system( this.mypi, 'rm -f ~/launch_ros_nodes_output.txt' );
    
        % Restart Pi, terminating all processes being run on Pi
        try
            system( this.mypi, 'sudo reboot +0.2' );
        catch E
        end
        clear this.mypi;
    end
end % Delete method
