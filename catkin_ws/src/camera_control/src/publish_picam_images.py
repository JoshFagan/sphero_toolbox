#!/usr/bin/env python3

import rospy
import roslib
roslib.load_manifest('camera_control')

import os
import time
import sys

import picamera
import numpy as np
from std_msgs.msg import String
from sensor_msgs.msg import Image


class ImagePublisher():
    def __init__(self, framerate, res_w, res_h):
        self.camera = picamera.PiCamera()
        self.camera.resolution = (res_w, res_h)
        self.camera.framerate = framerate
    
        self.image_data = np.empty((res_h, res_w, 3), dtype=np.uint8)
    
        self.image_msg = Image()
        self.image_msg.height = res_h 
        self.image_msg.width  = res_w 
        self.image_msg.encoding = "rgb8"
        self.image_msg.is_bigendian = False
        self.image_msg.step = 3 * res_w
    
        # Create publisher
        self.image_pub = rospy.Publisher('/sphero_sensors/image',
                                    Image, queue_size=1)
    
        # Create subscriber
        rospy.Subscriber("/sphero_sensors/request_data",
                         String, self.request_handler)


    def request_handler(self, request):
        if request.data == 'get_image':
            # Update image
            self.camera.capture(self.image_data, 'rgb')
    
            self.image_msg.header.stamp = rospy.Time.now()
            self.image_msg.data = self.image_data.tobytes()
    
            # Publish image
            self.image_pub.publish(self.image_msg)


if __name__ == '__main__':
    rospy.init_node('picam_image_publisher')

    # Get setting parameters
    framerate = float(rospy.get_param('/camera_control/framerate')) 
    res_w     = int(rospy.get_param('/camera_control/resolution_width')) 
    res_h     = int(rospy.get_param('/camera_control/resolution_height')) 

    image_pub = ImagePublisher(framerate, res_w, res_h)

    try:
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
    finally:
        image_pub.camera.close()
