function delete(this)
    % Class destructor, closes connection to Pi and terminates all running processes
    
    % Remove unneeded output file from Pi
    if ~isempty(this.mypi)
        system( this.mypi, 'rm ~/launch_ros_nodes_output.txt -f' );
    
        % Restart Pi, terminating all processes being run on Pi
        try
            system( this.mypi, 'sudo shutdown -r now' );
        catch E
        end
        clear this.mypi;
    end
    
    % Shutdown ROS master
    rosshutdown;
end % Delete method
