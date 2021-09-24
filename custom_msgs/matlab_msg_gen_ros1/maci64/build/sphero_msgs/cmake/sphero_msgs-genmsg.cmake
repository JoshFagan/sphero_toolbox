# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sphero_msgs: 7 messages, 0 services")

set(MSG_I_FLAGS "-Isphero_msgs:/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg;-Istd_msgs:/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sphero_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionResult.msg" NAME_WE)
add_custom_target(_sphero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_msgs" "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionResult.msg" "sphero_msgs/DriveControlResult:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlGoal.msg" NAME_WE)
add_custom_target(_sphero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_msgs" "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlGoal.msg" ""
)

get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlFeedback.msg" NAME_WE)
add_custom_target(_sphero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_msgs" "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlFeedback.msg" ""
)

get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionFeedback.msg" NAME_WE)
add_custom_target(_sphero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_msgs" "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionFeedback.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:sphero_msgs/DriveControlFeedback:std_msgs/Header"
)

get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionGoal.msg" NAME_WE)
add_custom_target(_sphero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_msgs" "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionGoal.msg" "actionlib_msgs/GoalID:sphero_msgs/DriveControlGoal:std_msgs/Header"
)

get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlAction.msg" NAME_WE)
add_custom_target(_sphero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_msgs" "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlAction.msg" "sphero_msgs/DriveControlActionResult:sphero_msgs/DriveControlActionGoal:std_msgs/Header:actionlib_msgs/GoalID:sphero_msgs/DriveControlFeedback:sphero_msgs/DriveControlResult:actionlib_msgs/GoalStatus:sphero_msgs/DriveControlGoal:sphero_msgs/DriveControlActionFeedback"
)

get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlResult.msg" NAME_WE)
add_custom_target(_sphero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_msgs" "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlResult.msg" ""
)

#
#  langs = gencpp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_msgs
)
_generate_msg_cpp(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionResult.msg"
  "${MSG_I_FLAGS}"
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlResult.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalID.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_msgs
)
_generate_msg_cpp(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_msgs
)
_generate_msg_cpp(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_msgs
)
_generate_msg_cpp(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalID.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlGoal.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_msgs
)
_generate_msg_cpp(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlAction.msg"
  "${MSG_I_FLAGS}"
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionResult.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionGoal.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/std_msgs/cmake/../msg/Header.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalID.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlFeedback.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlResult.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlGoal.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_msgs
)
_generate_msg_cpp(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalID.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlFeedback.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(sphero_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sphero_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sphero_msgs_generate_messages sphero_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionResult.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_cpp _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlGoal.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_cpp _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlFeedback.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_cpp _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionFeedback.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_cpp _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionGoal.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_cpp _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlAction.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_cpp _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlResult.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_cpp _sphero_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sphero_msgs_gencpp)
add_dependencies(sphero_msgs_gencpp sphero_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sphero_msgs_generate_messages_cpp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_msgs
)
_generate_msg_py(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionResult.msg"
  "${MSG_I_FLAGS}"
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlResult.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalID.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_msgs
)
_generate_msg_py(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_msgs
)
_generate_msg_py(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_msgs
)
_generate_msg_py(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalID.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlGoal.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_msgs
)
_generate_msg_py(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlAction.msg"
  "${MSG_I_FLAGS}"
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionResult.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionGoal.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/std_msgs/cmake/../msg/Header.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalID.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlFeedback.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlResult.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlGoal.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_msgs
)
_generate_msg_py(sphero_msgs
  "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/actionlib_msgs/cmake/../msg/GoalID.msg;/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlFeedback.msg;/Applications/MATLAB_R2021b.app/sys/ros1/maci64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(sphero_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sphero_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sphero_msgs_generate_messages sphero_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionResult.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_py _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlGoal.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_py _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlFeedback.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_py _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionFeedback.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_py _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlActionGoal.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_py _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlAction.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_py _sphero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/Users/josh/Documents/MATLAB/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/maci64/devel/share/sphero_msgs/msg/DriveControlResult.msg" NAME_WE)
add_dependencies(sphero_msgs_generate_messages_py _sphero_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sphero_msgs_genpy)
add_dependencies(sphero_msgs_genpy sphero_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sphero_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(sphero_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(sphero_msgs_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_msgs)
  install(CODE "execute_process(COMMAND \"/Users/josh/.matlab/R2021b/ros1/maci64/venv/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(sphero_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(sphero_msgs_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
