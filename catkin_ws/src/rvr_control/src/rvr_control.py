#!/usr/bin/env python3

import roslib
roslib.load_manifest('rvr_control')

import rospy
import sys
sys.path.append('/home/pi/sphero-sdk-raspberrypi-python/' )
sys.path.append('/home/pi/sphero_toolbox/catkin_ws/src/drive_control/src')
sys.path.append('/home/pi/sphero_toolbox/catkin_ws/src/sensor_control/src')

from drive_control_action import DriveControlServer
from publish_sphero_sensors import SpheroSensorPublisher 

from sphero_sdk import SpheroRvrObserver



def will_sleep_handler():
    print('RVR is about to sleep...')
    rvr.wake()
    
        
if __name__ == '__main__':
    global rvr 

    try:
        rospy.init_node('rvr_controller')
        stay_awake = rospy.get_param('rvr_control/stay_awake')

        rvr = SpheroRvrObserver()
        rvr.wake()
        rospy.sleep(2)

        if stay_awake:
            rvr.on_will_sleep_notify(will_sleep_handler)
    
        sphero_sensor_pub = SpheroSensorPublisher(rvr)
        drive_control     = DriveControlServer(rvr)

        rospy.spin()
    except rospy.ROSInterruptException:
        pass
    finally:
        rvr.close()
