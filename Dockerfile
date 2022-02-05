FROM ros:foxy-ros-base

# Make ROS2 Workspace Dirss
RUN mkdir -p /home/dev_ws/src

# Check out ROS-TCP-Endpoint, ROS2 version
RUN git clone https://github.com/Unity-Technologies/ROS-TCP-Endpoint /home/dev_ws/src/ros_tcp_endpoint -b ROS2v0.7.0

# Reference script with commands to source workspace
COPY ./set-up-workspace.sh /home/dev_ws/source_ros.sh

COPY ./car_msgs /home/dev_ws/src/car_msgs
COPY ./start.sh /home/dev_ws/src/start.sh
COPY ./setup.sh /home/dev_ws/src/setup.sh
RUN chmod +x /home/dev_ws/src/start.sh
RUN chmod +x /home/dev_ws/src/setup.sh

# Change to workspace on sign in
RUN echo "cd /home/dev_ws/src" >> ~/.bashrc

# Build the workspace
RUN cd home/dev_ws && . /opt/ros/foxy/setup.sh && colcon build --symlink-install

# Source the workspace on sign in
RUN echo ". /home/dev_ws/install/local_setup.bash" >> ~/.bashrc
RUN echo "source /home/dev_ws/install/setup.bash" >> ~/.bashrc

RUN apt update
RUN apt install vim -y
RUN apt install python3-pip -y
RUN apt install ffmpeg libsm6 libxext6 -y
RUN apt install tmux -y
