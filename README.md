# Docker image for [NagibSim](https://github.com/vadim-rm/NagibCarSimulator)

This image includes `setup.sh` file, that automatically creates the environment for the [NTO_ATC](https://github.com/proton-bit/NTO_ATC) repository

Run the following code to start the code:
```bash
docker build -t nagib -f Dockerfile .
docker run -it -p 10000:10000 nagib /bin/bash

source /home/dev_ws/src/install/setup.bash
./setup.sh
./start.sh
ros2 run car main
```
