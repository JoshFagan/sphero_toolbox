# Sphero Toolbox
A Matlab wrapper for using the Sphero Python SKD  
## Raspberry Pi Configuration
I am not sure what all settup Dr. B did before I recieved the Sphero, I will check with her and update with what she says. 

My best guess is that she performed the instructions from Sphero's [Setting Up Raspberry Pi](https://sdk.sphero.com/docs/getting_started/raspberry_pi/raspberry_pi_setup/) and the Sparkfun's [Getting Started with the Autonomous Kit for the Sphero RVR](https://learn.sparkfun.com/tutorials/getting-started-with-the-autonomous-kit-for-the-sphero-rvr/step-1-connect-the-sphero-rvr-to-the-app).

### Additional Configuration
These are additional generic configuration steps I had to perform to eliminate
errors.

#### Configure the UART 
1. Execute "raspi-config" 
2. Under "Interfacing Options", choose "Serial".
3. Say "No" when it asks if you want a login shell over serial.
4. Say "Yes" when asked if you want the hardware enabled.
5. Finish, then accept the offer to reboot.

#### Expand Free Space
1. Execute "raspi-config" 
2. Under "Advanced Options", choose "Expand Space"

#### Install ROS
I adopted these [GitHub Instructions](https://gist.github.com/Tiryoh/76be0ac467c09667ca51b5f8d9f4b3bc#file-ros_melodic_install_raspizero-bash) but found if I 
ran the curl command it errored out. Instead I ran the commands in the bash 
script line by line, expluding the initial "set -eu" line and it worked. Below
are the commands for simplicity sake.
```
$ sudo apt update
$ sudo apt install -y build-essential gdebi
$ mkdir -p ~/tmp && pushd ~/tmp
$ wget https://github.com/nomumu/ros4raspbian/releases/download/1.0.0/ros4raspbian-melodic-armhf-1.0.0.zip
$ unzip ros4raspbian-melodic-armhf-1.0.0.zip
$ sudo gdebi ros4raspbian-melodic-armhf-1.0.0.deb
$ popd
$ rosdep update
```

#### Download Sphero Toolbox
1. Download the zip file
2. scp it to the Pi
3. unzip it in the home directory


## Matlab Configuration
### Required Toolboxes
* MATLAB Support Package for Raspberry Pi Hardware
    - Used to connect to Pi and run commands via the "system" function
* ROS Toolbox
    - Used to send and recieve messages from the Pi
    - May require Matlab 2019 or later
* Parallel Computing Toolbox
    - Needed to run roslaunch files on the Pi 

After installing the MATLAB Support Package for Raspberry Pi Hardware 
configure your setup by:
1. Clicking "Home" tab
2. Clicking arrow under "Add-Ons"
3. Click "Manage Add-Ons"
4. Click little Gear to the right of MATLAB Support Package for Raspberry Pi Hardware
5. Follow the steps as prompted.
