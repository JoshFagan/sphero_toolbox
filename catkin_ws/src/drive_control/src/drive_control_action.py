#!/usr/bin/env python3

import roslib
roslib.load_manifest('drive_control')
import rospy
import actionlib

import argparse
import sys
sys.path.append('/home/pi/sphero-sdk-raspberrypi-python/' )

from play_motion_msgs.msg import PlayMotionAction as DriveControlAction
from play_motion_msgs.msg import PlayMotionResult as DriveControlResult

from sphero_sdk import SpheroRvrObserver
from sphero_sdk import RawMotorModesEnum 


class DriveControlServer():
    def __init__(self, rvr):
        self.rvr = rvr

        self.ap = argparse.ArgumentParser()
        self.ap.add_argument("--command", type=str, default='stop',
                             help="Command to run on RVR")
        self.ap.add_argument("--left_speed", type=int, default=0,
                             help="Speed to set left wheel")
        self.ap.add_argument("--right_speed", type=int, default=0,
                             help="Speed to set right wheel")
        self.ap.add_argument("--angle", type=int, default=0,
                             help="Angle at which to set the RVR")
        self.ap.add_argument("--heading", type=int, default=0,
                             help="Heading at which to set the RVR")
        self.ap.add_argument("--time", type=int, default=0,
                             help="Time to drive the RVR")
    
        self.result = DriveControlResult()
        self.server = actionlib.SimpleActionServer(
            'drive_control',
            DriveControlAction, 
            execute_cb=self.execute_cb, 
            auto_start=False)

        self.server.start()
        
      
    def execute_cb(self, args):
        args = args.motion_name.split()
        args = self.ap.parse_args(args)
        print('============================')
        print('Args Recieved:')
        print(args)
        if args.command == 'stop':
            self.drive_raw_motors(0, 0)
            self.rvr.roll_stop()
        elif args.command == 'drive_backward_seconds':
            self.rvr.drive_control.drive_backward_seconds(
                speed=args.left_speed,
                heading=0, 
                time_to_drive=args.time)
        elif args.command == 'drive_raw_motors':
            self.drive_raw_motors(args.left_speed, args.right_speed)
        elif args.command == 'turn_angle':
            self.rvr.drive_control.reset_heading()
            self.rvr.drive_control.turn_left_degrees(heading=0, 
                                                     amount=args.angle)
        elif args.command == 'reset_heading':
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
                right_speed=abs(right_speed)
            )

            rospy.sleep(0.1)
        
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
