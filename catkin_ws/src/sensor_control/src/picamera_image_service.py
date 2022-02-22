#!/usr/bin/env python3

import rospy
import roslib
roslib.load_manifest('sensor_control')

import picamera
import numpy as np
from sensor_msgs.msg import Image
from sphero_msgs.srv import GetPicameraImage, GetPicameraImageResponse


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
    
        self.service = rospy.Service('get_picamera_image', 
                                     GetPicameraImage, self.request_handler)


    def request_handler(self, request):
        # Update image
        self.camera.capture(self.image_data, 'rgb')

        self.image_msg.header.stamp = rospy.Time.now()
        self.image_msg.data = self.image_data.tobytes()

        # Respond with image
        return GetPicameraImageResponse(self.image_msg)


    def __del__(self):
        self.camera.close()


if __name__ == '__main__':
    rospy.init_node('picam_image_service')

    # Get setting parameters
    framerate = float(rospy.get_param('/picamera_control/framerate')) 
    res_w     = int(rospy.get_param('/picamera_control/resolution_width')) 
    res_h     = int(rospy.get_param('/picamera_control/resolution_height')) 

    image_pub = ImagePublisher(framerate, res_w, res_h)

    try:
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
    finally:
        image_pub.camera.close()
