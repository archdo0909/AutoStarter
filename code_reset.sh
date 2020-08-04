#!/bin/bash

sudo rm -rf ~/workspace/ai-contents-gyro-car/model
sudo rm -rf ~/workspace/ai-contents-gyro-car/src
sudo cp -r /usr/src/ai-contents-gyro-car/model ~/workspace/ai-contents-gyro-car
sudo cp -r /usr/src/ai-contents-gyro-car/src ~/workspace/ai-contents-gyro-car
sudo chmod -R 777 ~/workspace/ai-contents-gyro-car
