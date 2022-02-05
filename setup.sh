git clone https://github.com/proton-bit/NTO_ATC.git /home/dev_ws/src/car -b main
python3 -m pip install -r /home/dev_ws/src/car/car/requirements.txt
colcon build --symlink-install
