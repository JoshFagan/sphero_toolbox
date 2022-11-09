# Toolbox Installation for Raspberry Pi Running on RVR Sphero  

## Raspberry Pi Configuration
Perform the instructions from Sphero's [Setting Up Raspberry Pi](https://sdk.sphero.com/docs/getting_started/raspberry_pi/raspberry_pi_setup/) and the Sparkfun's [Getting Started with the Autonomous Kit for the Sphero RVR](https://learn.sparkfun.com/tutorials/getting-started-with-the-autonomous-kit-for-the-sphero-rvr/step-1-connect-the-sphero-rvr-to-the-app).

### Additional Configuration that May Need to be Performed

#### Configure the UART 
1. Execute "sudo raspi-config" 
2. Under "Interfacing Options", choose "Serial".
3. Say "No" when it asks if you want a login shell over serial.
4. Say "Yes" when asked if you want the hardware enabled.
5. Finish, then accept the offer to reboot.

#### Expand Free Space
1. Execute "sudo raspi-config" 
2. Under "Advanced Options", choose "Expand Space"

## Install Python Packages
Run the commands 
```
sudo apt-get update
sudo apt-get upgrade
```
<details>
<summary>If you get an error</summary>
  
If these commands error out with some messages involving "files list file for package \'\<package\>\' is missing final newline" then you will need to do the following steps to clean up the corrupted files.
1. `rm /var/lib/dpkg/info/<package>.list`
2. `sudo apt-get remove <package> --purge`
3. `sudo apt-get install <package>` (Not required if you do not intend on using \<package\>)

The common culprit files are 
* libreoffice-common.list
* libreoffice-help-en-gb.list
* libreoffice-help-common.list

You can preemptively perform the above steps for each one of the packages to save time. You also do not really need these packages, so performing step 3 is not necessary.

</details>

```
pip3 install aiohttp
pip3 install requests
pip3 install websocket-client
pip3 install pytest-asyncio
pip3 install pytest
pip3 install twine
pip3 install pyserial
pip3 install pyserial-asyncio
sudo apt-get update
sudo apt-get upgrade
```

## Install ROS
I adopted these [GitHub Instructions](https://gist.github.com/Tiryoh/76be0ac467c09667ca51b5f8d9f4b3bc#file-ros_melodic_install_raspizero-bash) but found if I 
ran the curl command it errored out. Instead I ran the commands in the bash 
script line by line (in the terminal), excluding the initial "set -eu" line and it worked. Below are the commands for simplicity sake.
```
sudo apt update
sudo apt install -y build-essential gdebi
mkdir -p ~/tmp && pushd ~/tmp
wget https://github.com/nomumu/ros4raspbian/releases/download/1.0.0/ros4raspbian-melodic-armhf-1.0.0.zip
unzip ros4raspbian-melodic-armhf-1.0.0.zip
sudo gdebi ros4raspbian-melodic-armhf-1.0.0.deb
popd
rosdep update
```
At the bottom of the file `~/.bashrc`, add the following lines:
```
source /opt/ros/melodic/setup.bash
export ROS_IP=<Pi's IP address>
```

At the command line execute the command:

```source ~/.bashrc```


## Download Sphero Toolbox
1. Download the zip file using the "Code" button on the [main project page](https://github.com/JoshFagan/sphero_toolbox)
2. Move the zip file to the home directory of the Pi
3. Unzip the file
4. Execute commands from terminal

```
cd sphero_toolbox/catkin_ws
catkin_make
```
At the bottom of the file `~/.bashrc`, add the following line:

```source ~/sphero_toolbox/catkin_ws/devel/setup.bash```

At the command line execute the command:

```source ~/.bashrc```
