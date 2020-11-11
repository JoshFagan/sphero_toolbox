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
        if goal.command == 'stop':
            self.rvr.roll_stop()
        elif goal.command == 'drive_raw_motors':
            self.drive_raw_motors(goal.left_speed, goal.right_speed)
        elif goal.command == 'turn_angle':
            self.rvr.drive_control.turn_left_degrees(heading=0, 
                                                     amount=goal.degrees)

        self.server.set_succeeded(self.result)

    def drive_raw_motors(self, left_speed, right_speed):
        # Adjust for negative goal speeds
        forward = RawMotorModesEnum.forward.value
        reverse = RawMotorModesEnum.reverse.value
        left_mode  = forward if left_speed >= 0 else reverse
        right_mode = forward if right_speed >= 0 else reverse

        while True:
            if self.server.is_preempt_requested():
                    self.server.set_preempted()
                    break
            self.rvr.raw_motors(
                left_mode=left_mode,
                left_speed=abs(left_speed),
                right_mode=right_mode,
                right_speed=abs(right_speed)
            )

            rospy.sleep(0.25)
        
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
