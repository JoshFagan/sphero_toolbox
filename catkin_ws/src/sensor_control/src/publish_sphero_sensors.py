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


rvr = SpheroRvrObserver()


def color_detected_handler(color_detected_data):
    print('Color detection data response: ', color_detected_data)


def ambient_light_handler(ambient_light_data):
    print('Ambient light data response: ', ambient_light_data)


def imu_handler(imu_data):
    print('IMU data response: ', imu_data)


def accelerometer_handler(accelerometer_data):
    print('Accelerometer data response: ', accelerometer_data)


def gyroscope_handler(gyroscope_data):
    print('Gyroscope data response: ', gyroscope_data)


def locator_handler(locator_data):
    print('Locator data response: ', locator_data)


def velocity_handler(velocity_data):
    print('Velocity data response: ', velocity_data)


def speed_handler(speed_data):
    print('Speed data response: ', speed_data)


def main():
    """ This program demonstrates how to enable multiple sensors to stream.
    """

    try:
        rvr.wake()

        # Give RVR time to wake up
        time.sleep(2)

        # Color detection
        rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.color_detection,
            handler=color_detected_handler
        )
        # Ambient light
        rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.ambient_light,
            handler=ambient_light_handler
        )
        # IMU
        rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.imu,
            handler=imu_handler
        )
        # Accelerometer
        rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.accelerometer,
            handler=accelerometer_handler
        )
        # Gyroscope
        rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.gyroscope,
            handler=gyroscope_handler
        )
        # Locator
        rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.locator,
            handler=locator_handler
        )
        # Velocity
        rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.velocity,
            handler=velocity_handler
        )
        # Speed
        rvr.sensor_control.add_sensor_data_handler(
            service=RvrStreamingServices.speed,
            handler=speed_handler
        )

        rvr.sensor_control.start(interval=250)

        while True:
            # Delay to allow RVR to stream sensor data
            time.sleep(1)

    except KeyboardInterrupt:
        print('\nProgram terminated with keyboard interrupt.')

    finally:
        rvr.sensor_control.clear()

        # Delay to allow RVR issue command before closing
        time.sleep(.5)
        
        rvr.close()


if __name__ == '__main__':
    main()
