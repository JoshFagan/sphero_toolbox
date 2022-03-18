#!/usr/bin/env python3

import roslib
roslib.load_manifest('matlab_interface')
import rospy

import argparse

from sphero_msgs.srv import OledInput 
from std_msgs.msg import String


class RPiOIInterface():
    def __init__(self):
        self.ap = argparse.ArgumentParser()
        self.ap.add_argument("--device", type=str, default='oled',
                             help="Device to interace with")
        self.ap.add_argument("--text", type=str, default='',
                             help="Text to display on OLED")
        self.ap.add_argument("--row", type=int, default=0,
                             help="Row to place cursor on")
        self.ap.add_argument("--col", type=int, default=0,
                             help="Col to place cursor on")

        # Create publisher
        self.oled_pub = rospy.Publisher('/rpi_io/oled_input',
                                    OledInput, queue_size=1)

        # Create subscribers
        rospy.Subscriber('/matlab_interface/rpi_io', String, 
                         self.command_handler)


    def command_handler(self, args):
        print(args)
        print(self.goal_msg)
        args = args.data.split()
        args = self.ap.parse_args(args)

        if args.device == 'oled' 
            oled_msg = OledInput()
            oled_msg.text = args.text
            oled_msg.row  = args.row
            oled_msg.col  = args.col
            self.oled_pub.publish(oled_msg)


if __name__ == '__main__':
    rospy.init_node('matlab_interface')

    matlab_interface = MatlabInterface()

    try:
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
