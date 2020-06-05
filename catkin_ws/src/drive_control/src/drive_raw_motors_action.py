#!/usr/bin/env python3

import roslib
roslib.load_manifest('drive_control')

import rospy
import actionlib

import sys
sys.path.append('/home/pi/sphero-sdk-raspberrypi-python/' )

from drive_control.msg import DriveRawMotorsAction, DriveRawMotorsResult 

from sphero_sdk import SpheroRvrObserver
from sphero_sdk import RawMotorModesEnum



class DriveRawMotorsServer():
    def __init__(self):
        self.rvr = SpheroRvrObserver()
        self.rvr.wake()
        self.rvr.reset_yaw()

        self.result = DriveRawMotorsResult(10)

        self.server = actionlib.SimpleActionServer(
            'drive_raw_motors',
            DriveRawMotorsAction, 
            execute_cb=self.execute_cb, 
            auto_start=False)

        self.server.start()
      
    def execute_cb(self, goal):
        self.rvr.raw_motors(
            left_mode=RawMotorModesEnum.forward.value,
            left_speed=goal.left_speed,  # Valid speed values are 0-255
            right_mode=RawMotorModesEnum.forward.value,
            right_speed=goal.right_speed  # Valid speed values are 0-255
        )

        self.server.set_succeeded(self.result)
        
if __name__ == '__main__':
    rospy.loginfo('=====================')
    rospy.init_node('drive_raw_motors_server')
    server = DriveRawMotorsServer()
    rospy.spin()
