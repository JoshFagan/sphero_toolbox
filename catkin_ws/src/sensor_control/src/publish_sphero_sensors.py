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

from std_msgs.msg import ColorRGBA, Float64, String
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Quaternion, Vector3


class SensorPublisher():
    def __init__(self, rvr):
        self.rvr = rvr

        self.color_msg = ColorRGBA()
        self.imu_msg   = Imu()
        self.light_msg = Float64()
        self.pos_msg   = Vector3()
        self.speed_msg = Float64()
        self.vel_msg   = Vector3()


        # Publishers
        self.color_pub = rospy.Publisher('/sphero_sensors/color_detected',
                                         ColorRGBA, queue_size=1)
        self.imu_pub   = rospy.Publisher('/sphero_sensors/imu',
                                         Imu, queue_size=1)
        self.light_pub = rospy.Publisher('/sphero_sensors/ambient_light',
                                         Float64, queue_size=1)
        self.pos_pub   = rospy.Publisher('/sphero_sensors/position',
                                         Vector3, queue_size=1)
        self.speed_pub = rospy.Publisher('/sphero_sensors/speed',
                                         Float64, queue_size=1)
        self.vel_pub   = rospy.Publisher('/sphero_sensors/velocity',
                                         Vector3, queue_size=1)

        # Subscribers
        rospy.Subscriber("/sphero_sensors/request_data", 
                         String, self.request_handler)

        # Set up RVR data streams 
        # Accelerometer 
        # Uses an empty handler as accelerometer data is added to IMU data
        # response when accelerometer is activated
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.accelerometer,
            handler=self.empty_handler
        )
        # Color detection
        self.rvr.enable_color_detection(is_enabled=True)
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.color_detection,
            handler=self.color_detected_handler
        )
        # Gyroscope
        # Uses an empty handler as gyroscope data is added to IMU data
        # response when gyroscope is activated
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.gyroscope,
            handler=self.empty_handler
        )
        # IMU
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.imu,
            handler=self.imu_handler
        )
        # Light
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.ambient_light,
            handler=self.light_handler
        )
        # Position 
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.locator,
            handler=self.position_handler
        )
        # Velocity
        self.rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.velocity,
            handler=self.velocity_handler
        )

        self.rvr.sensor_control.start(interval=500)


    def request_handler(self, request):
        if request.data == 'get_color_detected':
            self.color_pub.publish(self.color_msg)
        elif request.data == 'get_imu':
            self.imu_pub.publish(self.imu_msg)
        elif request.data == 'get_ambient_light':
            self.light_pub.publish(self.light_msg)
        elif request.data == 'get_position':
            self.pos_pub.publish(self.pos_msg)
        elif request.data == 'get_velocity':
            self.vel_pub.publish(vel_msg)
        elif request.data == 'get_speed':
            self.speed_pub.publish(self.speed_msg)


    def color_detected_handler(self, color_data):
        self.color_msg = ColorRGBA(color_data['ColorDetection']['R'],
                                   color_data['ColorDetection']['G'],
                                   color_data['ColorDetection']['B'],
                                   color_data['ColorDetection']['Confidence'])
    

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

        self.imu_msg = Imu(orientation=orientation, 
                           angular_velocity=angular_velocity, 
                           linear_acceleration=linear_acceleration)
    
    
    def light_handler(self, ambient_light_data):
        self.light_msg = Float64(ambient_light_data['AmbientLight']['Light'])
    
    
    def position_handler(self, locator_data):
        print('Position data response:', locator_data)

        self.pos_msg = Vector3(locator_data['Locator']['X'],
                               locator_data['Locator']['Y'], 0) 
    
    
    def velocity_handler(self, velocity_data):
        print('Velocity data response:', velocity_data)

        self.vel_msg = Vector3(velocity_data['Velocity']['X'],
                               velocity_data['Velocity']['Y'], 0) 
        # TODO: Add code to update speed message
    

    def empty_handler(self, data):
        pass
    
    
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
