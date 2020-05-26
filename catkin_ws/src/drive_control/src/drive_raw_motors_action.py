#!/usr/bin/env python3

import rospy
import actionlib

from drive_control.msg import DriveRawMotorsAction 

class DriveRawMotorsServer():
    def __init__(self):
        self.server = actionlib.SimpleActionServer(
            'drive_raw_motors',
            DriveRawMotorsAction, 
            execute_cb=self.execute_cb, 
            auto_start=False)

        self.server.start()
      
    def execute_cb(self, goal):
        rospy.loginfo('=====================')
        rospy.loginfo(goal)
        rospy.loginfo('=====================')
        
        self._action_server.set_succeeded(1)
#            # check that preempt has not been requested by the client
#            if self._as.is_preempt_requested():
#                rospy.loginfo('%s: Preempted' % self._action_name)
#                self._as.set_preempted()
#                success = False
#                break
        
if __name__ == '__main__':
    rospy.init_node('drive_raw_motors_server')
    server = DriveRawMotorsServer()
    rospy.spin()
