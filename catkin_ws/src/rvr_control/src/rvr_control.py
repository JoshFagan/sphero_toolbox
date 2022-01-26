#!/usr/bin/env python3

import roslib
roslib.load_manifest('rvr_control')

import rospy
import sys
sys.path.append('/home/pi/sphero-sdk-raspberrypi-python/' )
sys.path.append('/home/pi/sphero_toolbox/catkin_ws/src/drive_control/src')
sys.path.append('/home/pi/sphero_toolbox/catkin_ws/src/sensor_control/src')

from drive_control_action import DriveControlServer
from publish_sphero_sensors import SensorPublisher 

from sphero_sdk import SpheroRvrObserver

        
if __name__ == '__main__':
    try:
        rospy.init_node('rvr_controller')
        rvr = SpheroRvrObserver()
        rvr.wake()
        rospy.sleep(2)
    
        sensor_pub = SensorPublisher(rvr)
        drive_control = DriveControlServer(rvr)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
