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
