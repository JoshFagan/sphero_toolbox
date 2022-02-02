#!/usr/bin/env python3

import qwiic

import rospy
import roslib
roslib.load_manifest('sensor_control')
from std_msgs.msg import Float64, String


class RPiSensorPublisher():
    def __init__(self):
        self.tof = qwiic.QwiicVL53L1X()
        self.tof.sensor_init()
        self.tof.start_ranging()

        # Publishers
        self.dist_pub  = rospy.Publisher('/rpi_sensors/distance',
                                         Float64, queue_size=1)

        # Subscribers
        rospy.Subscriber("/rpi_sensors/request_data", 
                         String, self.request_handler)


    def request_handler(self, request):
        if request.data == 'get_distance':
            dist = self.tof.get_distance()
            dist_msg = Float64(dist/25.4)
            self.dist_pub.publish(dist_msg)


    def __del__(self):
        self.tof.stop_ranging()
    
    
if __name__ == '__main__':
    try:
        rospy.init_node('rpi_sensor_publisher')
    
        sensor_pub = RPiSensorPublisher()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
