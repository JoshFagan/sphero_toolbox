#!/usr/bin/env python3

import roslib
roslib.load_manifest('drive_control')
import rospy
import actionlib

import sys
sys.path.append('/home/pi/sphero-sdk-raspberrypi-python/' )

from sphero_msgs.msg import DriveControlAction
from sphero_msgs.msg import DriveControlResult

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
        
      
    def execute_cb(self, goal_msg):
        self.rvr.wake()
        print(goal_msg)
        if goal_msg.command == 'stop':
            self.drive_raw_motors(0, 0)
            self.rvr.roll_stop()
        elif goal_msg.command == 'drive_backward_seconds':
            self.rvr.drive_control.reset_heading()
            self.rvr.drive_control.drive_backward_seconds(
                speed=goal_msg.left_speed,
                heading=0, 
                time_to_drive=goal_msg.time)
        elif goal_msg.command == 'drive_raw_motors':
            self.drive_raw_motors(goal_msg.left_speed, goal_msg.right_speed)
        elif goal_msg.command == 'turn_angle':
            self.rvr.drive_control.reset_heading()
            self.rvr.drive_control.turn_left_degrees(heading=0, 
                                                     amount=goal_msg.angle)
        elif goal_msg.command == 'reset_heading':
            self.rvr.drive_control.reset_heading()

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
                right_speed=abs(right_speed))

            rospy.sleep(1)
            
            if left_speed == 0 and right_speed == 0:
                break
            
        
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
