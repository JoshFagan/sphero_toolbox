#!/usr/bin/env python3

import rospy
import roslib
roslib.load_manifest('sensor_control')

import os
import time
import sys
sys.path.append('/home/pi/sphero-sdk-raspberrypi-python/' )

from sphero_sdk import SpheroRvrObserver
from sphero_sdk import RvrStreamingServices

from std_msgs.msg import ColorRGBA, Float64


class SensorPublisher():
    def __init__(self, rvr):
        self.rvr = rvr

        # Publishers
        self.color_pub = rospy.Publisher('/sphero_sensors/color_detected',
                                         ColorRGBA, queue_size=1)
        self.amb_light_pub = rospy.Publisher('/sphero_sensors/ambient_light',
                                         Float64, queue_size=1)

        # Color detection
        self.rvr.enable_color_detection(is_enabled=True)
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.color_detection,
            handler=self.color_detected_handler
        )
        # Ambient light
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.ambient_light,
            handler=self.ambient_light_handler
        )
        # IMU
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.imu,
            handler=self.imu_handler
        )
#        # Locator
#        self.rvr.sensor_control.add_sensor_data_handler(
#            service=RvrStreamingServices.locator,
#            handler=self.locator_handler
#        )

        self.rvr.sensor_control.start(interval=1000)


    def color_detected_handler(self, color_data):
        color_msg = ColorRGBA(color_data['ColorDetection']['R'],
                              color_data['ColorDetection']['G'],
                              color_data['ColorDetection']['B'],
                              color_data['ColorDetection']['Confidence'])
        self.color_pub.publish(color_msg)
    
    
    def ambient_light_handler(self, ambient_light_data):
        light_msg = Float64(ambient_light_data['AmbientLight']['Light'])
        self.amb_light_pub.publish(light_msg)
    
    
    def imu_handler(self, imu_data):
        print('IMU data response: ', imu_data)
    
    
    def locator_handler(self, locator_data):
        print('Locator data response: ', locator_data)
    

if __name__ == '__main__':
    try:
        rospy.init_node('sensor_publisher')
    
        rvr = SpheroRvrObserver()
        rvr.wake()

        # Give RVR time to wake up
        rospy.sleep(2)

        rvr.reset_yaw()
        sensor_pub = SensorPublisher(rvr)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
    finally:
        rvr.sensor_control.clear()

        # Delay to allow RVR issue command before closing
        time.sleep(.5)
        
        rvr.close()
