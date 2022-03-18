#!/usr/bin/env python3

import qwiic

import rospy
import roslib
roslib.load_manifest('io_control')
from sphero_msgs.msg import OledInput 


class UpdateRPiOLED():
    def __init__(self):
        self.oled = qwiic.QwiicMicroOled()
        self.oled.begin()
        self.oled.clear(self.oled.ALL)

        # Subscribers
        rospy.Subscriber("/rpi_io/oled_input", 
                         OledInput, self.request_handler)


    def request_handler(self, request):
        self.oled.clear(self.oled.PAGE)
        self.oled.set_cursor(request.row, request.col)
        self.oled.print(reqest.text)
        self.oled.display()


    def __del__(self):
        self.oled.clear(self.oled.PAGE)
        self.oled.display()
    
    
if __name__ == '__main__':
    try:
        rospy.init_node('update_rpi_oled')
    
        oled_sub = UpdateRPiOLED()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
