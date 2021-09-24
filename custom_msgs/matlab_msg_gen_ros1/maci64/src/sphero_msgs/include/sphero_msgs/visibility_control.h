#ifndef SPHERO_MSGS__VISIBILITY_CONTROL_H_
#define SPHERO_MSGS__VISIBILITY_CONTROL_H_
#if defined _WIN32 || defined __CYGWIN__
  #ifdef __GNUC__
    #define SPHERO_MSGS_EXPORT __attribute__ ((dllexport))
    #define SPHERO_MSGS_IMPORT __attribute__ ((dllimport))
  #else
    #define SPHERO_MSGS_EXPORT __declspec(dllexport)
    #define SPHERO_MSGS_IMPORT __declspec(dllimport)
  #endif
  #ifdef SPHERO_MSGS_BUILDING_LIBRARY
    #define SPHERO_MSGS_PUBLIC SPHERO_MSGS_EXPORT
  #else
    #define SPHERO_MSGS_PUBLIC SPHERO_MSGS_IMPORT
  #endif
  #define SPHERO_MSGS_PUBLIC_TYPE SPHERO_MSGS_PUBLIC
  #define SPHERO_MSGS_LOCAL
#else
  #define SPHERO_MSGS_EXPORT __attribute__ ((visibility("default")))
  #define SPHERO_MSGS_IMPORT
  #if __GNUC__ >= 4
    #define SPHERO_MSGS_PUBLIC __attribute__ ((visibility("default")))
    #define SPHERO_MSGS_LOCAL  __attribute__ ((visibility("hidden")))
  #else
    #define SPHERO_MSGS_PUBLIC
    #define SPHERO_MSGS_LOCAL
  #endif
  #define SPHERO_MSGS_PUBLIC_TYPE
#endif
#endif  // SPHERO_MSGS__VISIBILITY_CONTROL_H_
// Generated 24-Sep-2021 10:53:40
// Copyright 2019-2020 The MathWorks, Inc.
