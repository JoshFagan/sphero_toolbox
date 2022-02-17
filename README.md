# Sphero Toolbox
This repo implements a ROS bridge to communicate between Matlab and the Raspberry Pi running on an RVR Sphero.

## To Do
### High Level Developmental Steps
#### Port Over from Roomba
- [ ] Sensor Readings
    - [ ] getAllSensors
    - [ ] getAngle
    - [ ] getBatteryInfo
    - [ ] getDistance	
    - [x] getImage
    - [ ] showCamera
    - [ ] testSensors
- [ ] Motor Control
    - [x] setDriveVelocity
    - [ ] setDriveVelocityRadius
    - [ ] moveDistance
    - [ ] setTurnVelocity
    - [x] stop
    - [x] turnAngle
- [ ] Beep
- [ ] songPlay
- [ ] setLEDs
#### Native Functionality in Sphero
- [ ] Sensor Readings
    - [x] Color sensor
    - [ ] Reset Locator X And Y
    - [x] Get Ambient Light Sensor Value
    - [x] IMU
    - [x] Accelerometer
    - [x] Gyroscope
- [x] Motor Control
    - [x] Raw Motors
        * Akin to (setDriveVelocity)
    - [x] Reset Yaw
        * Current direction is now considered forward
    - [x] Drive With Heading
    - [x] Drive for N seconds
- [ ] Pan/tilt camera
### Mid Level Developemental Steps
- [x] Motor Control
    - [x] Make setDriveVelocity drive forever (currently stops after a couple seconds)
    - [x] Account for negative velocities in setDriveVelocity
- [x] Input validation for each function
- [x] Create manager action server to schedule conflicting motor actions
    * E.x. going forward for N seconds, but performing a turn angle when client specifies
### Low Level Developemental Steps
- [x] Convert from ROS subscribers/publishers to ROS services/clients where applicable
    - [x] Convert to action servers for calls that make the Sphero move
        - [x] Use system calls to update paths
            * [Paths relative to sphero class](https://www.mathworks.com/matlabcentral/answers/250997-how-to-use-relative-path-to-use-matlab-file-in-another-computer)
            * [Paths to update](https://www.mathworks.com/help/ros/ug/ros-custom-message-support.html)
### Documentation
- [ ] Organize documentation
    - [ ] Contents of directory
    - [ ] How to run the Sphero
        - [ ] Getting Started Demo
        - [ ] API
    - [x] One time admin installation instructions for Pi
    - [x] Installation every student needs to do on their local machine
    - [ ] Dev documentation
        - [ ] How to add more actions
        - [ ] How to report more sensors
        - [ ] Using Linux for action message generation
- [ ] Add more descriptive comments
    - [ ] Especially to nontransparent system calls
