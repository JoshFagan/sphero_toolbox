#!/usr/bin/env python3

import roslib
roslib.load_manifest('drive_control')

import rospy
import actionlib

import sys
sys.path.append('/home/pi/sphero-sdk-raspberrypi-python/' )

from sphero_msgs.msg import DriveControlAction, DriveControlResult 

from sphero_sdk import SpheroRvrObserver
from sphero_sdk import RawMotorModesEnum 


class DriveControlServer():
    def __init__(self, rvr):
        self.rvr = rvr

        self.result = DriveControlResult()

        self.server = actionlib.SimpleActionServer(
            'drive_control',
            DriveControlAction, 
            execute_cb=self.execute_cb, 
            auto_start=False)

        self.server.start()
        
      
    def execute_cb(self, goal):
        # Adjust for negative goal speeds

        rospy.logdebug( goal.command )



        self.server.set_succeeded(self.result)
        
if __name__ == '__main__':
    try:
        rospy.init_node('drive_control_server')
    
        rvr = SpheroRvrObserver()
        rvr.wake()

        # Give RVR time to wake up
        rospy.sleep(2)

        rvr.reset_yaw()
        server = DriveControlServer(rvr)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
    finally:
        rvr.close()
