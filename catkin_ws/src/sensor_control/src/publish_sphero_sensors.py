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
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Quaternion, Vector3


class SensorPublisher():
    def __init__(self, rvr):
        self.rvr = rvr

        # Publishers
        self.color_pub = rospy.Publisher('/sphero_sensors/color_detected',
                                         ColorRGBA, queue_size=1)
        self.amb_light_pub = rospy.Publisher('/sphero_sensors/ambient_light',
                                         Float64, queue_size=1)
        self.imu_pub = rospy.Publisher('/sphero_sensors/imu',
                                         Imu, queue_size=1)
        self.pos_pub = rospy.Publisher('/sphero_sensors/position',
                                         Vector3, queue_size=1)
        self.vel_pub = rospy.Publisher('/sphero_sensors/velocity',
                                         Vector3, queue_size=1)
        self.speed_pub = rospy.Publisher('/sphero_sensors/speed',
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
        # Accelerometer
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.accelerometer,
            handler=self.empty_handler
        )
        # Gyroscope
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.gyroscope,
            handler=self.empty_handler
        )
        # Locator
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.locator,
            handler=self.locator_handler
        )
        # Velocity
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.velocity,
            handler=self.velocity_handler
        )
        # Speed
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.speed,
            handler=self.speed_handler
        )

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
        orientation = Quaternion(imu_data['IMU']['Roll'],
                                 imu_data['IMU']['Pitch'],
                                 imu_data['IMU']['Yaw'],
                                 0)

        angular_velocity = Vector3(imu_data['Gyroscope']['X'],
                                   imu_data['Gyroscope']['Y'],
                                   imu_data['Gyroscope']['Z'])

        linear_acceleration = Vector3(imu_data['Accelerometer']['X'],
                                      imu_data['Accelerometer']['Y'], 
                                      imu_data['Accelerometer']['Z'])

        imu_msg = Imu(orientation=orientation, 
                      angular_velocity=angular_velocity, 
                      linear_acceleration=linear_acceleration)
        self.imu_pub.publish(imu_msg)
    
    
    def locator_handler(self, locator_data):
        pos_msg = Vector3(locator_data['Locator']['X'],
                          locator_data['Locator']['Y'],
                          0) 
        self.pos_pub.publish(pos_msg)
    
    
    def velocity_handler(self, velocity_data):
        vel_msg = Vector3(velocity_data['Velocity']['X'],
                          velocity_data['Velocity']['Y'],
                          0) 
        self.vel_pub.publish(vel_msg)
    
    
    def speed_handler(self, speed_data):
        speed_msg = Float64(speed_data['Speed']['Speed'])
        self.speed_pub.publish(speed_msg)


    def empty_handler(self, data):
        pass
    
    
if __name__ == '__main__':
    try:
        rospy.init_node('sensor_publisher')
    
        rvr = SpheroRvrObserver()
        print( rvr.sensor_control.supported_sensors())
        print( rvr.sensor_control.enabled_sensors())
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
