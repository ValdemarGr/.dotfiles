cmake_minimum_required(VERSION 3.12)
project(windowstuff)
add_executable(windowstuff src/main.cpp)

# I3 STUFF
add_subdirectory(i3ipc++)

include_directories(${I3IPCpp_INCLUDE_DIRS})
link_directories(${I3IPCpp_LIBRARY_DIRS})