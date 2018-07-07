#!/bin/bash
source /opt/ros/kinetic/setup.bash
source /home/amsl/ros_catkin_ws/devel/setup.bash

source /home/amsl/.bashrc

# roscore
gnome-terminal -e "/opt/ros/kinetic/bin/roscore" --geometry=50x12+0+0 &
sleep 1s

# use_sim_time true
gnome-terminal -e "rosparam set use_sim_time true" --geometry=50x12+0+0 &
sleep 1s

# Launch TF
gnome-terminal -e "/opt/ros/kinetic/bin/roslaunch sensor_fusion sq2_zed.launch" --geometry=50x12+0+250 &
sleep 1s

# Transform 
gnome-terminal -e "/opt/ros/kinetic/bin/roslaunch sensor_fusion transform_listener.launch" --geometry=50x12+0+500 &
sleep 1s

# Republish
gnome-terminal -e "/opt/ros/kinetic/bin/roslaunch sensor_fusion republish.launch" --geometry=50x12+0+750 &
sleep 1s

# bag
gnome-terminal -e "/opt/ros/kinetic/bin/rosbag play /home/amsl/bagfiles/sq2/2018-07-07-17-25-01.bag --clock -l" --geometry=50x12+2000+500 &
sleep 1s

# rviz
gnome-terminal -e '/opt/ros/kinetic/bin/rosrun rviz rviz -d /home/amsl/.rviz/depthimage.rviz' --geometry=50x12+2000+750 &
sleep 1s
