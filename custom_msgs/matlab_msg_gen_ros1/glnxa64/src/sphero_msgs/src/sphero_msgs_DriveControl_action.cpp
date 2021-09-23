// Copyright 2020-2021 The MathWorks, Inc.
// Common copy functions for sphero_msgs/DriveControlGoal
#include "boost/date_time.hpp"
#include "boost/shared_array.hpp"
#ifdef _MSC_VER
#pragma warning(push)
#pragma warning(disable : 4244)
#pragma warning(disable : 4265)
#pragma warning(disable : 4458)
#pragma warning(disable : 4100)
#pragma warning(disable : 4127)
#pragma warning(disable : 4267)
#pragma warning(disable : 4068)
#pragma warning(disable : 4245)
#else
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
#pragma GCC diagnostic ignored "-Wunused-local-typedefs"
#pragma GCC diagnostic ignored "-Wredundant-decls"
#pragma GCC diagnostic ignored "-Wnon-virtual-dtor"
#pragma GCC diagnostic ignored "-Wdelete-non-virtual-dtor"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wshadow"
#endif //_MSC_VER
#include "ros/ros.h"
#include "sphero_msgs/DriveControlAction.h"
#include "actionlib/client/simple_action_client.h"
#include "actionlib/server/simple_action_server.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSActionTemplates.hpp"

class SPHERO_MSGS_EXPORT sphero_msgs_msg_DriveControlGoal_common : public MATLABROSMsgInterface<sphero_msgs::DriveControlGoal> {
  public:
    virtual ~sphero_msgs_msg_DriveControlGoal_common(){}
    virtual void copy_from_struct(sphero_msgs::DriveControlGoal* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const sphero_msgs::DriveControlGoal* msg, MultiLibLoader loader, size_t size = 1);
};
  //----------------------------------------------------------------------------
  void sphero_msgs_msg_DriveControlGoal_common::copy_from_struct(sphero_msgs::DriveControlGoal* msg, const matlab::data::Struct& arr, MultiLibLoader loader) {
    try {
        //command
        const matlab::data::CharArray command_arr = arr["Command"];
        msg->command = command_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Command' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Command' is wrong type; expected a string.");
    }
    try {
        //left_speed
        const matlab::data::TypedArray<int16_t> left_speed_arr = arr["LeftSpeed"];
        msg->left_speed = left_speed_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'LeftSpeed' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'LeftSpeed' is wrong type; expected a int16.");
    }
    try {
        //right_speed
        const matlab::data::TypedArray<int16_t> right_speed_arr = arr["RightSpeed"];
        msg->right_speed = right_speed_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'RightSpeed' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'RightSpeed' is wrong type; expected a int16.");
    }
    try {
        //angle
        const matlab::data::TypedArray<int16_t> angle_arr = arr["Angle"];
        msg->angle = angle_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Angle' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Angle' is wrong type; expected a int16.");
    }
    try {
        //heading
        const matlab::data::TypedArray<int16_t> heading_arr = arr["Heading"];
        msg->heading = heading_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Heading' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Heading' is wrong type; expected a int16.");
    }
    try {
        //time
        const matlab::data::TypedArray<int16_t> time_arr = arr["Time"];
        msg->time = time_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Time' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Time' is wrong type; expected a int16.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T sphero_msgs_msg_DriveControlGoal_common::get_arr(MDFactory_T& factory, const sphero_msgs::DriveControlGoal* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Command","LeftSpeed","RightSpeed","Angle","Heading","Time"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("sphero_msgs/DriveControlGoal");
    // command
    auto currentElement_command = (msg + ctr)->command;
    outArray[ctr]["Command"] = factory.createCharArray(currentElement_command);
    // left_speed
    auto currentElement_left_speed = (msg + ctr)->left_speed;
    outArray[ctr]["LeftSpeed"] = factory.createScalar(currentElement_left_speed);
    // right_speed
    auto currentElement_right_speed = (msg + ctr)->right_speed;
    outArray[ctr]["RightSpeed"] = factory.createScalar(currentElement_right_speed);
    // angle
    auto currentElement_angle = (msg + ctr)->angle;
    outArray[ctr]["Angle"] = factory.createScalar(currentElement_angle);
    // heading
    auto currentElement_heading = (msg + ctr)->heading;
    outArray[ctr]["Heading"] = factory.createScalar(currentElement_heading);
    // time
    auto currentElement_time = (msg + ctr)->time;
    outArray[ctr]["Time"] = factory.createScalar(currentElement_time);
    }
    return std::move(outArray);
  }

class SPHERO_MSGS_EXPORT sphero_msgs_msg_DriveControlResult_common : public MATLABROSMsgInterface<sphero_msgs::DriveControlResult> {
  public:
    virtual ~sphero_msgs_msg_DriveControlResult_common(){}
    virtual void copy_from_struct(sphero_msgs::DriveControlResult* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const sphero_msgs::DriveControlResult* msg, MultiLibLoader loader, size_t size = 1);
};
  //----------------------------------------------------------------------------
  void sphero_msgs_msg_DriveControlResult_common::copy_from_struct(sphero_msgs::DriveControlResult* msg, const matlab::data::Struct& arr, MultiLibLoader loader) {
    try {
        //result
        const matlab::data::TypedArray<uint8_t> result_arr = arr["Result"];
        msg->result = result_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Result' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Result' is wrong type; expected a uint8.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T sphero_msgs_msg_DriveControlResult_common::get_arr(MDFactory_T& factory, const sphero_msgs::DriveControlResult* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Result"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("sphero_msgs/DriveControlResult");
    // result
    auto currentElement_result = (msg + ctr)->result;
    outArray[ctr]["Result"] = factory.createScalar(currentElement_result);
    }
    return std::move(outArray);
  }

class SPHERO_MSGS_EXPORT sphero_msgs_msg_DriveControlFeedback_common : public MATLABROSMsgInterface<sphero_msgs::DriveControlFeedback> {
  public:
    virtual ~sphero_msgs_msg_DriveControlFeedback_common(){}
    virtual void copy_from_struct(sphero_msgs::DriveControlFeedback* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const sphero_msgs::DriveControlFeedback* msg, MultiLibLoader loader, size_t size = 1);
};
  //----------------------------------------------------------------------------
  void sphero_msgs_msg_DriveControlFeedback_common::copy_from_struct(sphero_msgs::DriveControlFeedback* msg, const matlab::data::Struct& arr, MultiLibLoader loader) {
    try {
        //feedback
        const matlab::data::TypedArray<uint8_t> feedback_arr = arr["Feedback"];
        msg->feedback = feedback_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Feedback' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Feedback' is wrong type; expected a uint8.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T sphero_msgs_msg_DriveControlFeedback_common::get_arr(MDFactory_T& factory, const sphero_msgs::DriveControlFeedback* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Feedback"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("sphero_msgs/DriveControlFeedback");
    // feedback
    auto currentElement_feedback = (msg + ctr)->feedback;
    outArray[ctr]["Feedback"] = factory.createScalar(currentElement_feedback);
    }
    return std::move(outArray);
  }

class SPHERO_MSGS_EXPORT sphero_msgs_DriveControl_action : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~sphero_msgs_DriveControl_action(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABActClientInterface> generateActClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          sphero_msgs_DriveControl_action::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eGoal){
        ptr = std::make_shared<ROSPublisherImpl<sphero_msgs::DriveControlGoal,sphero_msgs_msg_DriveControlGoal_common>>();
    }else if(type == eFeedback){
        ptr = std::make_shared<ROSPublisherImpl<sphero_msgs::DriveControlFeedback,sphero_msgs_msg_DriveControlFeedback_common>>();
    }else if(type == eResult){
        ptr = std::make_shared<ROSPublisherImpl<sphero_msgs::DriveControlResult,sphero_msgs_msg_DriveControlResult_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Goal' or 'Feedback' or 'Result'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         sphero_msgs_DriveControl_action::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eGoal){
        ptr = std::make_shared<ROSSubscriberImpl<sphero_msgs::DriveControlGoal,sphero_msgs::DriveControlGoal::ConstPtr,sphero_msgs_msg_DriveControlGoal_common>>();
    }else if(type == eFeedback){
        ptr = std::make_shared<ROSSubscriberImpl<sphero_msgs::DriveControlFeedback,sphero_msgs::DriveControlFeedback::ConstPtr,sphero_msgs_msg_DriveControlFeedback_common>>();
    }else if(type == eResult){
        ptr = std::make_shared<ROSSubscriberImpl<sphero_msgs::DriveControlResult,sphero_msgs::DriveControlResult::ConstPtr,sphero_msgs_msg_DriveControlResult_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Goal' or 'Feedback' or 'Result'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABActClientInterface> 
          sphero_msgs_DriveControl_action::generateActClientInterface(){
      return std::make_shared<ROSActClientImpl<sphero_msgs::DriveControlAction,sphero_msgs::DriveControlGoal,sphero_msgs::DriveControlFeedbackConstPtr,sphero_msgs::DriveControlResultConstPtr,sphero_msgs_msg_DriveControlGoal_common,sphero_msgs_msg_DriveControlFeedback_common,sphero_msgs_msg_DriveControlResult_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          sphero_msgs_DriveControl_action::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eGoal){
        ptr = std::make_shared<ROSBagWriterImpl<sphero_msgs::DriveControlGoal,sphero_msgs_msg_DriveControlGoal_common>>();
    }else if(type == eFeedback){
        ptr = std::make_shared<ROSBagWriterImpl<sphero_msgs::DriveControlFeedback,sphero_msgs_msg_DriveControlFeedback_common>>();
    }else if(type == eResult){
        ptr = std::make_shared<ROSBagWriterImpl<sphero_msgs::DriveControlResult,sphero_msgs_msg_DriveControlResult_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Goal' or 'Feedback' or 'Result'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(sphero_msgs_msg_DriveControlGoal_common, MATLABROSMsgInterface<sphero_msgs::DriveControlGoal>)
CLASS_LOADER_REGISTER_CLASS(sphero_msgs_msg_DriveControlFeedback_common, MATLABROSMsgInterface<sphero_msgs::DriveControlFeedback>)
CLASS_LOADER_REGISTER_CLASS(sphero_msgs_msg_DriveControlResult_common, MATLABROSMsgInterface<sphero_msgs::DriveControlResult>)
CLASS_LOADER_REGISTER_CLASS(sphero_msgs_DriveControl_action, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1