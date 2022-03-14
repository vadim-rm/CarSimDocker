git clone https://github.com/proton-bit/SelfDrivingCar.git /home/dev_ws/src/car -b main
python3 -m pip install -r /home/dev_ws/src/car/car/requirements.txt
colcon build --symlink-install
