# Install script for directory: /Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/src/sphero_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sphero_msgs/action" TYPE FILE FILES "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/src/sphero_msgs/action/DriveControl.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sphero_msgs/msg" TYPE FILE FILES
    "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlAction.msg"
    "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionGoal.msg"
    "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionResult.msg"
    "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionFeedback.msg"
    "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlGoal.msg"
    "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlResult.msg"
    "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sphero_msgs/cmake" TYPE FILE FILES "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/build/sphero_msgs/catkin_generated/installspace/sphero_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/include/sphero_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/Users/josh/.matlab/R2021b/ros1/maci64/venv/bin/python2" -m compileall "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/lib/python2.7/site-packages/sphero_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/site-packages" TYPE DIRECTORY FILES "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/lib/python2.7/site-packages/sphero_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/build/sphero_msgs/catkin_generated/installspace/sphero_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sphero_msgs/cmake" TYPE FILE FILES "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/build/sphero_msgs/catkin_generated/installspace/sphero_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sphero_msgs/cmake" TYPE FILE FILES
    "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/build/sphero_msgs/catkin_generated/installspace/sphero_msgsConfig.cmake"
    "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/build/sphero_msgs/catkin_generated/installspace/sphero_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sphero_msgs" TYPE FILE FILES "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/src/sphero_msgs/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/src/sphero_msgs/include/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/lib/libsphero_msgs_matlab.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsphero_msgs_matlab.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsphero_msgs_matlab.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsphero_msgs_matlab.dylib")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/m/" TYPE DIRECTORY FILES "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/src/sphero_msgs/m/" FILES_MATCHING REGEX "/[^/]*\\.m$")
endif()

