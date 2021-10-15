# Toolbox Installation for Matlab 

## ***Important Notes:***
* Do not edit any of the files in the `sphero_toolbox`
    * These files provide prebuilt functions for you to use, if you edit them they will no longer work as intended
* Do not give your own Matlab files the same name as any file in `sphero_toolbox`
    * If you do, Matlab will use your file instead of the files defined in `sphero_toolbox`
      <details>
      <summary>Recommended Best Practices Tip</summary>
  
      Before naming a file, check to make sure a file with that name does not already exist in Matlab's environment. We can check for the existance of a file/function called `hello_world` by running the command `which hello_world`. If any result other than "'hello_world' not found." is displayed then the file/function already exists and you should choose a different name.
      </details>
* Do not do any developement in the `sphero_toolbox`
    * The `sphero_toolbox` should be saved in an out of the way, appropriate location (see below instructions) and developement (creation of new files) should be done in a separate location. **You should not be creating files for your EF230 projects in the sphero_toolbox folder.**
      <details>
      <summary>Recommended Best Practices Tip</summary>
  
      "You live in the house that you keep" is a quote I first heard from one of my college professors and it has stuck with me and saved me from a lot of pain and suffering over the years. Simply put, a small amount of routine maintanance keeps you from being so cluttered you have a hard time being productive or from having to dedicate a whole weekend to stuff like cleaning up 10,000 unread emails... We should take this same approach when managing the files we create for classes. Below is an example structure that I use and recommend. 
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
1. Ensure you meet [ROS System Requirements](https://www.mathworks.com/help/ros/gs/ros-system-requirements.html)

   Visit the above link and make sure you have all of the software installed that is specified for your operating system under the heading "ROS 1 Requirements". Do not install any software specified under any other heading. **The pieces of software are independent; if you have trouble installing one of them, make sure you install the others and we can help fix the issue in class.**
   
   Specifically, make sure you have:
      
   <details>
   <summary>Linux</summary>
   
      
   * [Python](https://www.python.org/downloads/release/python-2718/) version 2.7
   
      This should come already installed on your system. To ensure that it is, execute the command `!python --version` in the MATLAB command window. You should see an output similar to "Python 2.7.XX".
   
      If something is wrong and you do not have Python 2.7 you can follow [this tutorial](https://tecadmin.net/install-python-2-7-on-ubuntu-and-linuxmint/) to install Python 2.7. During installation, if you are asked if you want to add Python to your path, indicate yes. 

   * [CMake](https://cmake.org/download/) version 3.15.5 or higher. 
   
      You can check to see if you already satisfy this requirement by executing the command `!cmake --version` in MATLAB's command window. 
   
      If you need to install CMake, use the above link to download and run the .sh file listed beside "Linux x86_64". During installation, if you are asked if you want to add CMake to your path, indicate yes.
   
   * [GNU Compiler Collection (GCC)](https://gcc.gnu.org/) version 6.3+
   
      You can check to see if you already satisfy this requirement by executing the command `!gcc --version` in MATLAB's command window.
   
      If you need to install gcc you can follow [this tutorial](https://linuxize.com/post/how-to-install-gcc-compiler-on-ubuntu-18-04/) to install it.
   </details>
   <details>
   <summary>Mac</summary>
   
   * [Python](https://www.python.org/downloads/release/python-2718/) version 2.7
   
      This should come already installed on your system. To ensure that it is, execute the command `!python --version` in the MATLAB command window. You should see an output similar to "Python 2.7.XX".
   
      If something is wrong and you do not have Python 2.7 you can download and install it from the above link, selecting the file `macOS 64-bit installer`. During installation, if you are asked if you want to add Python to your path, indicate yes. 

   * [CMake](https://cmake.org/download/) version 3.15.5 or higher. 
   
      You can check to see if you already satisfy this requirement by executing the command `!cmake --version` in MATLAB's command window. 
   
      If you need to install CMake, use the above link to download and run the .dmg file listed beside "macOS 10.13 or later". During installation, if you are asked if you want to add CMake to your path, indicate yes.
   
   * Download and install Xcode from the AppStore
   </details>

   <details>
   <summary>PC</summary>
   
   * [Python](https://www.python.org/downloads/release/python-2718/) version 2.7
   
      To check that it is installed, execute the command `!python --version` in the MATLAB command window. You should see an output similar to "Python 2.7.XX". If you do not have any output, then you need to follow [this tutorial](https://www.pythontutorial.net/getting-started/install-python/) to install Python 2.7. **Make sure when selecting which version of Python to download that you download a version that starts with 2.7**. Here is a link to the latest 2.7 version which is [Python 2.7.18](https://www.python.org/downloads/release/python-2718/). I suggest you use that version. **Make sure you indicate yes where asked if you want to add Python to your path.** 
   
   * [CMake](https://cmake.org/download/) version 3.15.5 or higher. 
   
      You can check to see if you already satisfy this requirement by executing the command `!cmake --version` in MATLAB's command window. 
   
      If you need to install CMake, use the above link to download and run the .msi file listed beside "Windows x64 Installer". During installation, if you are asked if you want to add CMake to your path, indicate yes.
   
   * Download and install [Visual Studio](https://www.mathworks.com/matlabcentral/answers/443349-how-do-i-install-visual-studio-2017-or-2019-for-use-with-matlab-simulink) 2017 or 2019.
   
      **While running the installer for Visual Studio, make sure that the "Desktop development with C++" workload is selected.**
   </details>
2. Restart Matlab if you already have it open
3. Ensure the following Matlab Support Packages are installed
    * MATLAB Support Package for Raspberry Pi Hardware
    * ROS Toolbox
      <details>
      <summary>Instructions for Checking and Installing Support Packages</summary>
  
      1. In Matlab, click on the "Home" tab
      2. Click on the 3 stacked cubes icon above "Add-Ons"
      3. Search for the support package of interest
          * You will either see that it is installed, or you can click on it to install it
      </details>
4. Download the `sphero_toolbox`

   1. Go to the [sphero_toolbox GitHub Repo](https://github.com/JoshFagan/sphero_toolbox)
   2. Click the green "Code" button
   3. Click "Download ZIP"
   4. Exctract the .zip file on your computer
   5. If the name of the extracted folder is `sphero_toolbox-master` then change the name to be `sphero_toolbox`

5. Move the `sphero_toolbox` to the specified location. **It is very important to make sure you store the `sphero_toolbox` folder where directed.**
      <details>
      <summary>Mac and Linux</summary>
  
      * The location is "/Users/<user\>/Documents/MATLAB" (where `<user>` is your user name on the computer)
      * So you should have "/Users/<user\>/Documents/MATLAB/sphero_toolbox"
      </details>
   
      <details>
      <summary>Windows</summary>
  
      * The location is "C:\ProgramData\MATLAB"
      * So you should have "C:\ProgramData\MATLAB\sphero_toolbox"
      </details>
5. **For PCs only** (Mac and Linux users can skip to step 6)
   
   Follow [these instructions](https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/) to add the `Windows_Alias` folder in the `sphero_toolbox` to your system path. This folder (`Windows_Alias`) already exists in this toolbox (`sphero_toolbox`), all you need to do is add it to your system path. One helpful note when you are following those instructions, after you select "New" you can also select "Browse" to bring up a dialog box to find the `Windows_Alias` folder, instead of having the type the path out by hand.
6. In Matlab open and run the file "configure_installation.m". **If you run into errors, check the troubleshooting tabs below to see if there is a solution already.**
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
      1. In the `Terminal` application, execute the command 
         
         `printf "\nsetenv('PATH', [getenv('PATH') '$PATH'])\n\n"`
      2. Paste and run the resulting output in the MATLAB command window
      3. Rerun the configuration script
      </details>
7. Run the commands indicated by Matlab
   
8. Test to make sure everything worked properly by executing the following command in the matlab command window:
   
   `m = rosmessage('sphero_msgs/DriveControlAction')`
   
   If it gives you an error, then something has gone wrong and you need to check in with a TA
      
