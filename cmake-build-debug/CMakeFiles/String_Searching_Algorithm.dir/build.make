# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/williamleonards/Documents/String Searching Algorithm"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/williamleonards/Documents/String Searching Algorithm/cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/String_Searching_Algorithm.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/String_Searching_Algorithm.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/String_Searching_Algorithm.dir/flags.make

CMakeFiles/String_Searching_Algorithm.dir/main.cpp.o: CMakeFiles/String_Searching_Algorithm.dir/flags.make
CMakeFiles/String_Searching_Algorithm.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/williamleonards/Documents/String Searching Algorithm/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/String_Searching_Algorithm.dir/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/String_Searching_Algorithm.dir/main.cpp.o -c "/Users/williamleonards/Documents/String Searching Algorithm/main.cpp"

CMakeFiles/String_Searching_Algorithm.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/String_Searching_Algorithm.dir/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/williamleonards/Documents/String Searching Algorithm/main.cpp" > CMakeFiles/String_Searching_Algorithm.dir/main.cpp.i

CMakeFiles/String_Searching_Algorithm.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/String_Searching_Algorithm.dir/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/williamleonards/Documents/String Searching Algorithm/main.cpp" -o CMakeFiles/String_Searching_Algorithm.dir/main.cpp.s

CMakeFiles/String_Searching_Algorithm.dir/test.cpp.o: CMakeFiles/String_Searching_Algorithm.dir/flags.make
CMakeFiles/String_Searching_Algorithm.dir/test.cpp.o: ../test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/williamleonards/Documents/String Searching Algorithm/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/String_Searching_Algorithm.dir/test.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/String_Searching_Algorithm.dir/test.cpp.o -c "/Users/williamleonards/Documents/String Searching Algorithm/test.cpp"

CMakeFiles/String_Searching_Algorithm.dir/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/String_Searching_Algorithm.dir/test.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/williamleonards/Documents/String Searching Algorithm/test.cpp" > CMakeFiles/String_Searching_Algorithm.dir/test.cpp.i

CMakeFiles/String_Searching_Algorithm.dir/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/String_Searching_Algorithm.dir/test.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/williamleonards/Documents/String Searching Algorithm/test.cpp" -o CMakeFiles/String_Searching_Algorithm.dir/test.cpp.s

# Object files for target String_Searching_Algorithm
String_Searching_Algorithm_OBJECTS = \
"CMakeFiles/String_Searching_Algorithm.dir/main.cpp.o" \
"CMakeFiles/String_Searching_Algorithm.dir/test.cpp.o"

# External object files for target String_Searching_Algorithm
String_Searching_Algorithm_EXTERNAL_OBJECTS =

String_Searching_Algorithm: CMakeFiles/String_Searching_Algorithm.dir/main.cpp.o
String_Searching_Algorithm: CMakeFiles/String_Searching_Algorithm.dir/test.cpp.o
String_Searching_Algorithm: CMakeFiles/String_Searching_Algorithm.dir/build.make
String_Searching_Algorithm: CMakeFiles/String_Searching_Algorithm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/williamleonards/Documents/String Searching Algorithm/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable String_Searching_Algorithm"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/String_Searching_Algorithm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/String_Searching_Algorithm.dir/build: String_Searching_Algorithm

.PHONY : CMakeFiles/String_Searching_Algorithm.dir/build

CMakeFiles/String_Searching_Algorithm.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/String_Searching_Algorithm.dir/cmake_clean.cmake
.PHONY : CMakeFiles/String_Searching_Algorithm.dir/clean

CMakeFiles/String_Searching_Algorithm.dir/depend:
	cd "/Users/williamleonards/Documents/String Searching Algorithm/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/williamleonards/Documents/String Searching Algorithm" "/Users/williamleonards/Documents/String Searching Algorithm" "/Users/williamleonards/Documents/String Searching Algorithm/cmake-build-debug" "/Users/williamleonards/Documents/String Searching Algorithm/cmake-build-debug" "/Users/williamleonards/Documents/String Searching Algorithm/cmake-build-debug/CMakeFiles/String_Searching_Algorithm.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/String_Searching_Algorithm.dir/depend
