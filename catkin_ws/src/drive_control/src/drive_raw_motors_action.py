#!/usr/bin/env python3

import roslib
roslib.load_manifest('drive_control')

import rospy
import actionlib

import sys
sys.path.append('/home/pi/sphero-sdk-raspberrypi-python/' )

from sphero_msgs.msg import DriveRawMotorsAction, DriveRawMotorsResult 

from sphero_sdk import SpheroRvrObserver
from sphero_sdk import RawMotorModesEnum 


class DriveRawMotorsServer():
    def __init__(self):
        self.rvr = SpheroRvrObserver()
        self.rvr.wake()
        self.rvr.reset_yaw()

        self.result = DriveRawMotorsResult()

        self.server = actionlib.SimpleActionServer(
            'drive_raw_motors',
            DriveRawMotorsAction, 
            execute_cb=self.execute_cb, 
            auto_start=False)

        self.server.start()
      
    def execute_cb(self, goal):
        # Adjust for negative goal speeds
        forward = RawMotorModesEnum.forward.value
        reverse = RawMotorModesEnum.reverse.value
        left_mode  = forward if goal.left_speed >= 0 else reverse
        right_mode = forward if goal.right_speed >= 0 else reverse

        self.rvr.raw_motors(
            left_mode=left_mode,
            left_speed=abs(goal.left_speed),  # Valid speed values are 0-255
            right_mode=right_mode,
            right_speed=abs(goal.right_speed)  # Valid speed values are 0-255
        )

        self.server.set_succeeded(self.result)
        
if __name__ == '__main__':
    rospy.loginfo('=====================')
    rospy.init_node('drive_raw_motors_server')
    server = DriveRawMotorsServer()
    rospy.spin()
