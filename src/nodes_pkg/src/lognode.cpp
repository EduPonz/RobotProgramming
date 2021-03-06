#include "ros/ros.h"
#include "std_msgs/String.h"
#include "geometry_msgs/Point.h"
#include "geometry_msgs/PointStamped.h"
#include <ros/console.h>
#include <iostream>
#include <string.h>
#include <string>
#include <signal.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sstream>
#include <fstream> 

using namespace std;

ofstream myfile ("log_file.txt");

class LogNode{
    private: 
      // Declaring private variables
      float pointx;
      float pointy;
      float pointz;
      string message;
      // This function converts a float into a string
      string _floatToString(float val){
        string s;
        stringstream ss (stringstream::in | stringstream::out);
        ss << val;
        s = ss.str();
        return s;
      }
      // This function writes the text "The 'the task' operation has been received!" 
      // to a .txt file
      void _saveTaskFunc(string x, ofstream &myfile) {
        myfile << "The '" << x << "' operation has been received! " << endl;
      }
      // This function receives the "task" text from the interface and calls on the "_saveTaskFunc" function
      // while printing the "task" text to the screen
      void _taskFunc(const std_msgs::String::ConstPtr& task_msg) {
        cout << " The '" << task_msg->data.c_str() <<"' operation has been received!" << endl;
        message = task_msg->data.c_str();
        _saveTaskFunc(message, myfile);
      }
      // This function writes the text "The operation has been received 
      // for the coordinates" and the chosen coordinates to a .txt file
      void _savePointFunc(float x, float y, float z, ofstream &myfile){
        myfile << "The operation has been received for the coordinates: ("
               << _floatToString(x) << ") (" << _floatToString(y)
               << ") (" << _floatToString(z) << ") " << endl << endl;     
      }
      // This function receives the coordinates from the interface and calls on the "_savepointFunc" function
      // while printing "The operation has been received for the coordinates: " and the coordinates 
      // to the screen
      void _pointFunc(const geometry_msgs::Point::ConstPtr& point_msg){
        cout << " The operation has been received for the coordinates: " << endl << " ("
             << point_msg->x << ", " 
             << point_msg->y << ", "
             << point_msg->z << ")" << endl << endl;
        pointx = point_msg->x; 
        pointy = point_msg->y;
        pointz = point_msg->z;
        _savePointFunc(pointx, pointy, pointz, myfile);
      }
    public:
      //LogNode class construction
      LogNode(ros::NodeHandle n){
        ros::Subscriber click_sub = n.subscribe("point_coordinates", 100, &LogNode::_pointFunc, this);
        ros::Subscriber task_sub = n.subscribe("task", 100, &LogNode::_taskFunc, this);
        ros::spin();
      };
      ~LogNode() {};
 };


int main(int argc, char **argv) {
  ros::init(argc, argv, "lognode");
  ros::NodeHandle myNodeHandle;
  LogNode myLogNode (myNodeHandle);
  myfile.close();
  return 0;
}
