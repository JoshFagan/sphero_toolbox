#!/usr/bin/env python3
# license removed for brevity
import rospy
from std_msgs.msg import String


pub = rospy.Publisher('/relay_out', String, queue_size=1)

def callback(data):
    pub.publish(data)

def relay():
    rospy.Subscriber('/relay_in', String, callback)

    rospy.init_node('relay', anonymous=True)

    rospy.spin()

if __name__ == '__main__':
    try:
        relay()
    except rospy.ROSInterruptException:
        pass
