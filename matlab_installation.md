# Toolbox Installation for Matlab 

***Important Notes:***
* Do not edit any of the files in the `sphero_toolbox`
    * These files provide prebuilt functions for you to use, if you edit them they will no longer work as intended
* Do not give your own Matlab files the same name as any file in `sphero_toolbox`
    * If you do, Matlab will use your file instead of the files defined in `sphero_toolbox`
      <details>
      <summary>Recommended Best Practices Tip</summary>
  
      Before naming a file, check to make sure a file with that name does not already exist in Matlab's environment. We can check for the existance of a file/function called `hello_world` by running the command `which hello_world`. If any result other than "'hello_world' not found." is displayed then the file/function already exists and you should choose a different name.
      </details>
* Do not do any developement in the `sphero_toolbox`
    * The `sphero_toolbox` should be saved in an out of the way, appropriate location (see below instructions) and developement (creation of new files) should be done in a separate location
      <details>
      <summary>Recommended Best Practices Tip</summary>
  
      "You live in the house that you keep" is a quote I first heard from one of my college professors and it has stuck with me and saved me from a lot of pain and suffering over the years. Simply put, a small amount of routine maintanance keeps you from being so cluttered you have a hard time being productive or from having to dedicate a whole weekend to stuff like cleaning up 10,000 unread emails...  We should take this same approach when managing the files we create for classes. Below is an example structure that I use and recommend. 
      ```
      - Home
          - Classes
              - EF230
                  - Projects
                      - Data_Analysis
                      - Exploring_Exoplanets
                  - Homework
                      - Homework_1
                          - problem_1.m
                          - problem_2.m
                      - Homework_2
                  - Quiz_Prep
              - MATH241
              - ECON213
      ```
      </details>

## Installation Instructions
1. Remote login must be enabled for the Pi to communicate with the local computer
      <details>
      <summary>Mac and Linux</summary>
  
      1. Open "System Preferences"
      2. Select "Sharing"
      3. Check on the "Remote Login" button
      </details>
   
      <details>
      <summary>Windows</summary>
  
      [Instructions for enabling remote login on Windows 10](https://www.windowscentral.com/how-use-remove-desktop-app-connect-pc-windows-10-0)
      </details>
2. Ensure the following Matlab Support Packages are installed
    * MATLAB Support Package for Raspberry Pi Hardware
    * ROS Toolbox
      <details>
      <summary>Instructions for Checking and Installing Support Packages</summary>
  
      1. In Matlab, click on the "Home" tab
      2. Click on the 3 stacked cubes icon above "Add-Ons"
      3. Search for the support package of interest
          * You will either see that it is installed, or you can click on it to install it
      </details>
3. Download the `sphero_toolbox`
4. Move the `sphero_toolbox` to the folder storing the support packages
      <details>
      <summary>Mac and Linux</summary>
  
      * The location is "/Users/<user\>/Documents/MATLAB" (where <user> is your user name on the computer)
      * So you should have "/Users/<user\>/Documents/MATLAB/sphero_toolbox"
      </details>
   
      <details>
      <summary>Windows</summary>
  
      * The location is "C:\ProgramData\MATLAB" (where <user> is your user name on the computer)
      * So you should have "C:\ProgramData\MATLAB\sphero_toolbox"
      </details>
5. In Matlab open and run the file "configure_installation.m"
      <details>
      <summary>Troubleshooting Mac</summary>
  
      If you get an error that states:
      > Could not find CMake in your system. Please install CMake version 3.15.5 or higher and rerun the command.
         
      Check that CMake is installed on your computer by opening the `Terminal` application and executing the following command:
      ```
      which cmake
      ```
      If there is no output then you do not have CMake installed and you need to follow the instructions to do that. 
      If you do have output, it usually means MATLAB's system path and your computer's system path are different.
      To fix this, perform the following steps:
      1. In the terminal, execute the command 
         
         `printf "\nsetenv('PATH', [getenv('PATH') '$PATH'])\n\n"`
      2. Paste and run the resulting output in the MATLAB command window
      3. Rerun the configuration script
      </details>
6. Restart Matlab
      <details>
      <summary>Handling Potential Warnings On Future Restarts</summary>
        
      When you restart Matlab you may recieve a warning message that states something along the lines of
      > Warning: Name is nonexistent or not a directory:
      > /private/var/folders/h4/gq3470kn2194b1jl62ws_s3h0000gn/T/Editor_vxdxq 
      
      Here is a simple fix for this:
      1. In Matlab, click the "Home" tab
      2. Click the button "Set Path" (it's icon looks like a folder ontop of another folder)
      3. Click the name of the offending folder/item
      4. Click "Remove"
      5. Click "Save"
      6. Click "Colse"
      </details>
