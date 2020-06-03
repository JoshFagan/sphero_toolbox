# Toolbox Installation for Matlab 

***Important Notes:***
* Do not edit any of the files in the `sphero_toolbox`
    * These files provide prebuilt functions for you to use, if you edit them they will no longer work as intended
      <details>
      <summary>Optional Intuition Example</summary>
  
      We can calculate the sine of pi by using Matlab's built in ```sin``` function and running `sin(pi)`. We can also track down and modify the built in `sin` function, but if we do this and then call `sin(pi)` we will likely get a completely incorrect answer. The same would happen if you were to open and modify any of the files in `sphero_toolbox`.
      </details>
* Do not give your own Matlab files the same name as any file in `sphero_toolbox`
    * If you do, Matlab will use your file instead of the files defined in `sphero_toolbox`
      <details>
      <summary>Recommended Best Practice Example</summary>
  
      Before naming a file, check to make sure a file with that name does not already exist in Matlab's environment. We can check for the existance of a file/function called `hello_world` by running the command `which hello_world`. If any result other than "'hello_world' not found." is displayed then the file/function already exists and you should choose a different name.
      </details>

## Installation Instructions
1. Ensure the following Matlab Support Packages are installed
    * MATLAB Support Package for Raspberry Pi Hardware
    * ROS Toolbox
      <details>
      <summary>Instructions for Checking and Installing Support Packages</summary>
  
      1. In Matlab, click on the "Home" tab
      2. Click on the 3 stacked cubes icon above "Add-Ons"
      3. Search for the support package of interest
          * You will either see that it is installed, or you can click on it to install it
      </details>
2. Download the `sphero_toolbox`
3. Move the `sphero_toolbox` to the folder storing the support packages
    * On windows this shoud be "C:\ProgramData\MATLAB\"
        * So you should have "C:\ProgramData\MATLAB\sphero_toolbox"
    * On Mac this should be "/Users/<user\>/Documents/MATLAB" (where <user> is your user name on the computer)
        * So you should have "/Users/<user\>/Documents/MATLAB/sphero_toolbox"
4. In Matlab open and run the file "configure_installation.m"
5. Restart Matlab
