;; Auto-generated. Do not edit!


(when (boundp 'nodes_pkg::PointStamped)
  (if (not (find-package "NODES_PKG"))
    (make-package "NODES_PKG"))
  (shadow 'PointStamped (find-package "NODES_PKG")))
(unless (find-package "NODES_PKG::POINTSTAMPED")
  (make-package "NODES_PKG::POINTSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude PointStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass nodes_pkg::PointStamped
  :super ros::object
  :slots (_header _point ))

(defmethod nodes_pkg::PointStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:point __point) (instance nodes_pkg::Point :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _point __point)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; nodes_pkg/Point _point
    (send _point :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; nodes_pkg/Point _point
       (send _point :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; nodes_pkg/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;;
   self)
  )

(setf (get nodes_pkg::PointStamped :md5sum-) "c63aecb41bfdfd6b7e1fac37c7cbe7bf")
(setf (get nodes_pkg::PointStamped :datatype-) "nodes_pkg/PointStamped")
(setf (get nodes_pkg::PointStamped :definition-)
      "Header header
Point point
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: nodes_pkg/Point
float64 x
float64 y
float64 z

")



(provide :nodes_pkg/PointStamped "c63aecb41bfdfd6b7e1fac37c7cbe7bf")


