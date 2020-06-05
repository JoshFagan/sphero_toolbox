# Sphero Toolbox
This repo implements a ROS bridge to communicate between Matlab and the Raspberry Pi running on an RVR Sphero.

## To Do
- [ ] Input validation for each function
- [ ] getImage functionality
- [ ] getSensors functionality
    - [ ] Color sensor
    - [ ] IR sensors
- [ ] Pan/tilt camera
- [ ] Make setDriveVelocity drive forever (currently stops after a couple seconds)
- [ ] Account for negative velocities
- [ ] Organize documentation
    - [ ] Contents of directory
    - [ ] How to run the Sphero
    - [x] One time admin installation instructions for Pi
    - [x] Installation every student needs to do on their local machine
- [ ] Add more descriptive comments
    - [ ] Especially to system calls so future devs know why I did what I did
- [ ] Convert from ROS subscribers/publishers to ROS services/clients where applicable
    - [ ] Convert to action servers for calls that make the Sphero move
        - [ ] Write up about using Linux for message generation
        - [ ] Use system calls to update paths
            * [Paths relative to sphero class](https://www.mathworks.com/matlabcentral/answers/250997-how-to-use-relative-path-to-use-matlab-file-in-another-computer)
            * [Paths to update](https://www.mathworks.com/help/ros/ug/ros-custom-message-support.html)
- [ ] Create Mr. Manager action server to schedule conflicting motor actions
    * E.x. going forward for N seconds, but performing a turn angle when client specifies
- [ ] Start all actions with "sphero"
