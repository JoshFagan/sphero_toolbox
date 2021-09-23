// Generated by gencpp from file sphero_msgs/DriveControlResult.msg
// DO NOT EDIT!


#ifndef SPHERO_MSGS_MESSAGE_DRIVECONTROLRESULT_H
#define SPHERO_MSGS_MESSAGE_DRIVECONTROLRESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sphero_msgs
{
template <class ContainerAllocator>
struct DriveControlResult_
{
  typedef DriveControlResult_<ContainerAllocator> Type;

  DriveControlResult_()
    : result(0)  {
    }
  DriveControlResult_(const ContainerAllocator& _alloc)
    : result(0)  {
  (void)_alloc;
    }



   typedef uint8_t _result_type;
  _result_type result;





  typedef boost::shared_ptr< ::sphero_msgs::DriveControlResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sphero_msgs::DriveControlResult_<ContainerAllocator> const> ConstPtr;

}; // struct DriveControlResult_

typedef ::sphero_msgs::DriveControlResult_<std::allocator<void> > DriveControlResult;

typedef boost::shared_ptr< ::sphero_msgs::DriveControlResult > DriveControlResultPtr;
typedef boost::shared_ptr< ::sphero_msgs::DriveControlResult const> DriveControlResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sphero_msgs::DriveControlResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sphero_msgs::DriveControlResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sphero_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sphero_msgs': ['/home/josh/GTA/sphero_toolbox/custom_msgs/matlab_msg_gen_ros1/glnxa64/devel/share/sphero_msgs/msg'], 'actionlib_msgs': ['/home/josh/Applications/R2021b/sys/ros1/glnxa64/ros1/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/home/josh/Applications/R2021b/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sphero_msgs::DriveControlResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sphero_msgs::DriveControlResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sphero_msgs::DriveControlResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sphero_msgs::DriveControlResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sphero_msgs::DriveControlResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sphero_msgs::DriveControlResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sphero_msgs::DriveControlResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "25458147911545c320c4c0a299eff763";
  }

  static const char* value(const ::sphero_msgs::DriveControlResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x25458147911545c3ULL;
  static const uint64_t static_value2 = 0x20c4c0a299eff763ULL;
};

template<class ContainerAllocator>
struct DataType< ::sphero_msgs::DriveControlResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sphero_msgs/DriveControlResult";
  }

  static const char* value(const ::sphero_msgs::DriveControlResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sphero_msgs::DriveControlResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"# Result: Success of completing the drive command\n"
"uint8 result \n"
;
  }

  static const char* value(const ::sphero_msgs::DriveControlResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sphero_msgs::DriveControlResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DriveControlResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sphero_msgs::DriveControlResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sphero_msgs::DriveControlResult_<ContainerAllocator>& v)
  {
    s << indent << "result: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SPHERO_MSGS_MESSAGE_DRIVECONTROLRESULT_H
