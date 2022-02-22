#!/usr/bin/env python3

import roslib
roslib.load_manifest('drive_control')
import rospy
import actionlib

import argparse

from sphero_msgs.srv import GetPicameraImage 
from sphero_msgs.srv import GetPicameraImageRequest 
from sphero_msgs.msg import DriveControlAction
from sphero_msgs.msg import DriveControlGoal
from std_msgs.msg import String
from sensor_msgs.msg import Image


class MatlabInterface():
    def __init__(self):
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

        self.goal_msg = DriveControlGoal()

        # Create publisher
        self.image_pub = rospy.Publisher('/rpi_sensors/image',
                                    Image, queue_size=1)

        # Create subscribers
        rospy.Subscriber('/matlab_interface/drive_command', String, 
                         self.command_handler)
        rospy.Subscriber("/rpi_sensors/request_data",
                         String, self.image_request_handler)

        # Create Action Client
        self.client = actionlib.SimpleActionClient('drive_control', 
                                                   DriveControlAction)
        self.client.wait_for_server()

        # Create Service Client
        rospy.wait_for_service('get_picamera_iamge')
        self.get_picamera_image = rospy.ServiceProxy('get_picamera_image', 
                                                     GetPicameraImage)


    def command_handler(self, args):
        print(args)
        print(self.goal_msg)
        args = args.data.split()
        args = self.ap.parse_args(args)

        self.goal_msg.command     = args.command
        self.goal_msg.left_speed  = args.left_speed
        self.goal_msg.right_speed = args.right_speed
        self.goal_msg.angle       = args.angle
        self.goal_msg.heading     = args.heading
        self.goal_msg.time        = args.time

        self.client.send_goal(self.goal_msg)


    def image_request_handler(self, request):
        if request.data == 'get_image':
            image = self.get_picamera_image()
            self.image_pub.publish(image)
    

if __name__ == '__main__':
    rospy.init_node('matlab_interface')

    matlab_interface = MatlabInterface()

    try:
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
