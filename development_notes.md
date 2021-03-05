# Development Notes
A document dedicated to important and helpful information related to adding functionality to this toolbox.

## Adding a Physical Control Element
Anything that controls a physical element of the robot (e.g. wheel motors, on board servos) should be implemented as a ROS action service. Actions that interfere with each other (drive forward, turn left, etc.) should be implemented as multiple actions on one action service. This allows for new actions to preempt old actions (stop moving forward if I am now telling you to turn left). If the physical control element should belong to an already existing ROS action service, then add it to that service, following the instructions in [Adding a New Action to an Existing ROS Action Service](##Adding-a-New-Action-to-an-Existing-ROS-Action-Service). If there is no existing section suitable for the action you want to implement, follow the instructions in [Writing a ROS Action Service](##Writing-a-ROS-Action-Service).

Currently implemented ROS action services:
* Drive Control Service

## Adding a New Action to an Existing ROS Action Service

## Writing a ROS Action Service
* Link to simple instructions online
* Make sure to include message file like so `from sphero_msgs.msg import DriveRawMotorsAction`

### Writing Custom ROS Aciton Messages
* Link to simple example
* Project convention means this file should be in 'sphero_toolbox/catkin_ws/src/sphero_msgs/action'

### Generating Matlab Messages from Custom ROS Action Messages 
This step did not work on my mac, but did work on my linux machine. It still works to copy the generated files over to my Mac system and use them there. 
* [Instructions for importing custom messages into Matlab](https://www.mathworks.com/help/ros/ug/ros-custom-message-support.html)
1. Ensure you have the "ROS Toolbox Interface for ROS Custom Messages"
2. Make sure the most recent version of `sphero_msgs` is in the directory `msg_gen`
    1. In the terminal, navigate to `sphero_toolbox/catkin_ws/src`
    2. `cp -r sphero_msgs ../../msg_gen`
3. Remove old Matlab generated messages
    1. In the terminal, navigate to `sphero_toolbox/msg_gen`
    2. Execute the command: `rm -r matlab_gen`
3. In Matlab, navigate to `sphero_toolbox`
4. In the Matlab command window execute the command: `rosgenmsg('msg_gen')`

### Creating Matlab Action Client
