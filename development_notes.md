# Development Notes
A document dedicated to important and helpful information related to adding functionality to this toolbox.

## Adding a Physical Control Element
Anything that controls a physical element of the robot (e.g. wheel motors, on board servos) should be implemented with a 
ROS Action Server. 

### Writing a ROS Action Service
* Link to simple instructions online
* Make sure to include message file like so `from sphero_msgs.msg import DriveRawMotorsAction`

### Writing Custom ROS Aciton Messages
* Link to simple example
* Project convension means this file should be in 'sphero_toolbox/catkin_ws/src/sphero_msgs/action'

### Generating Matlab Messages from Custom ROS Action Messages 
This step did not work on my mac, but did work on my linux machine. It still works to copy the generated files over to my Mac system and use them there. 
* Link to simple instructions
* Ensure you have the "ROS Toolbox Interface for ROS Custom Messages"
* `rosgenmsg('msg_gen')`

### Creating Matlab Action Client