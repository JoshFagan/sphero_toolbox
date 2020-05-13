#!/usr/bin/env python3
# license removed for brevity
import rospy
from std_msgs.msg import Int32MultiArray 

import os
import sys
import time
sys.path.append('/home/pi/sphero-sdk-raspberrypi-python/' )

from sphero_sdk import SpheroRvrObserver
from sphero_sdk import RawMotorModesEnum


rvr = SpheroRvrObserver()

def callback(data):
    rvr.raw_motors(
        left_mode=RawMotorModesEnum.forward.value,
        left_speed=data.data[0],  # Valid speed values are 0-255
        right_mode=RawMotorModesEnum.forward.value,
        right_speed=data.data[1]  # Valid speed values are 0-255
    )


def drive_motors():
    rospy.Subscriber( '/wheel_vel', Int32MultiArray, callback )

    rospy.init_node('talker', anonymous=True)

    rospy.spin()


def main():
    """ This program has RVR drive around in different directions.
    """

    try:
        rvr.wake()
        rvr.reset_yaw()
        drive_motors()
    except rospy.ROSInterruptException:
        pass


if __name__ == '__main__':
    main()
