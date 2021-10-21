#!/usr/bin/env python3

import rospy
import roslib
roslib.load_manifest('camera_control')

import os
import time
import sys

import picamera
import numpy as np
from sensor_msgs.msg import Image


def image_publisher():
    # Get setting parameters
    framerate = float(rospy.get_param('/camera_control/framerate')) 
    pub_rate  = float(rospy.get_param('/camera_control/publish_rate')) 
    res_w     = int(rospy.get_param('/camera_control/resolution_width')) 
    res_h     = int(rospy.get_param('/camera_control/resolution_height')) 

    # Setup pi camera variable
    camera = picamera.PiCamera()
    camera.resolution = (res_w, res_h)
    camera.framerate = framerate
    output = np.empty((res_h, res_w, 3), dtype=np.uint8)
    msg = Image()
    msg.height = res_h 
    msg.width  = res_w 
    msg.encoding = "rgb8"
    msg.is_bigendian = False
    msg.step = 3 * res_w
    time.sleep(2)

    # Create publisher
    image_pub = rospy.Publisher('/sphero_sensors/image',
                                Image, queue_size=1)

    rospy.init_node('image_publisher', anonymous=True)
    rate = rospy.Rate(pub_rate) # 10hz
    while not rospy.is_shutdown():
        camera.capture(output, 'rgb')

        msg.header.stamp = rospy.Time.now()
        msg.data = output.tobytes()

        image_pub.publish(msg)
        rate.sleep()

    camera.close()

if __name__ == '__main__':
    try:
        image_publisher()
    except rospy.ROSInterruptException:
        pass
