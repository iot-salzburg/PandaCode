#!/bin/bash



echo "Is the ROBOT unfolded??"
read -n 1 -s -r -p "Press any key to continue"
echo 


gnome-terminal -e "bash -c 'roslaunch franka_control franka_control.launch robot_ip:=192.168.13.1'"
#sleep 5
#gnome-terminal -e "roslaunch franka_gripper franka_gripper.launch robot_ip:=192.168.13.1"
sleep 5

rostopic pub -1 /franka_control/error_recovery/goal franka_control/ErrorRecoveryActionGoal "{}"
gnome-terminal -e "bash -c 'roslaunch panda_moveit_config panda_moveit.launch'"
sleep 5
gnome-terminal -e "bash -c 'roslaunch panda_moveit_config moveit_rviz.launch'"
sleep 5
gnome-terminal -e "bash -c 'cd ~/libfranka/ws_moveit/ && source devel/setup.bash && rosrun niks_experiments Stretching'"
sleep 5
gnome-terminal -e "bash -c 'cd ~/libfranka/ws_moveit/ && source devel/setup.bash && rosrun niks_experiments opc_ua_ros_server.py'"

sleep 15
echo "PRESS 'Continue'"

#Im Rviz Fenster -> obere Leiste "Panel" -> Add New Panel -> RvizVisualToolsgui (OK Drücken, nicht doppelklick)
#Dann unten auf "Continue"

# for astra camera support --> digital cage
# roslaunch astra_launch astra.launch

# PerceptionNode
# roslaunch perception perception_node.launch

# save point cloud to pcd file
# rosrun pcl_ros pointcloud_to_pcd input:=/camera/depth/points

# play point cloud from pcd file
# rosrun pcl_ros pcd_to_pointcloud ProofOfConceptCloud.pcd 0.1 _frame_id:=camera_link

# in every terminal window started:
# unset PYTHONPATH
