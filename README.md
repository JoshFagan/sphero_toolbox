# Sphero Toolbox
A Matlab wrapper for using the Sphero Python SKD  
## Raspberry Pi Configuration
I am not sure what all settup Dr. B did before I recieved the Sphero, I will check with her and update with what she says. 

My best guess is that she performed the instructions from Sphero's [Setting Up Raspberry Pi](https://sdk.sphero.com/docs/getting_started/raspberry_pi/raspberry_pi_setup/) and the Sparkfun's [Getting Started with the Autonomous Kit for the Sphero RVR](https://learn.sparkfun.com/tutorials/getting-started-with-the-autonomous-kit-for-the-sphero-rvr/step-1-connect-the-sphero-rvr-to-the-app).

### Additional Configuration
These are additional generic configuration steps I had to perform to eliminate
errors.

#### Configure the UART 
You can use "raspi-config" utility to enable the UART:
1. Under "Interfacing Options", choose "Serial".
2. Say "No" when it asks if you want a login shell over serial.
3. Say "Yes" when asked if you want the hardware enabled.
4. Finish, then accept the offer to reboot.

## Matlab Configuration
