# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

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
CMAKE_COMMAND = /opt/clion-2019.2/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /opt/clion-2019.2/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/piotr/CodeProjects/MhcEvo2000

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/MHC_code_OBA.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/MHC_code_OBA.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MHC_code_OBA.dir/flags.make

CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.o: ../src/Antigen.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.o -c /home/piotr/CodeProjects/MhcEvo2000/src/Antigen.cpp

CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/CodeProjects/MhcEvo2000/src/Antigen.cpp > CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.i

CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/CodeProjects/MhcEvo2000/src/Antigen.cpp -o CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.s

CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.o: ../src/DataHandler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.o -c /home/piotr/CodeProjects/MhcEvo2000/src/DataHandler.cpp

CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/CodeProjects/MhcEvo2000/src/DataHandler.cpp > CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.i

CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/CodeProjects/MhcEvo2000/src/DataHandler.cpp -o CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.s

CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.o: ../src/Environment.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.o -c /home/piotr/CodeProjects/MhcEvo2000/src/Environment.cpp

CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/CodeProjects/MhcEvo2000/src/Environment.cpp > CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.i

CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/CodeProjects/MhcEvo2000/src/Environment.cpp -o CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.s

CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.o: ../src/Gene.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.o -c /home/piotr/CodeProjects/MhcEvo2000/src/Gene.cpp

CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/CodeProjects/MhcEvo2000/src/Gene.cpp > CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.i

CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/CodeProjects/MhcEvo2000/src/Gene.cpp -o CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.s

CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.o: ../src/H2Pinteraction.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.o -c /home/piotr/CodeProjects/MhcEvo2000/src/H2Pinteraction.cpp

CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/CodeProjects/MhcEvo2000/src/H2Pinteraction.cpp > CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.i

CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/CodeProjects/MhcEvo2000/src/H2Pinteraction.cpp -o CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.s

CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.o: ../src/Host.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.o -c /home/piotr/CodeProjects/MhcEvo2000/src/Host.cpp

CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/CodeProjects/MhcEvo2000/src/Host.cpp > CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.i

CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/CodeProjects/MhcEvo2000/src/Host.cpp -o CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.s

CMakeFiles/MHC_code_OBA.dir/main.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/MHC_code_OBA.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/main.cpp.o -c /home/piotr/CodeProjects/MhcEvo2000/main.cpp

CMakeFiles/MHC_code_OBA.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/CodeProjects/MhcEvo2000/main.cpp > CMakeFiles/MHC_code_OBA.dir/main.cpp.i

CMakeFiles/MHC_code_OBA.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/CodeProjects/MhcEvo2000/main.cpp -o CMakeFiles/MHC_code_OBA.dir/main.cpp.s

CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.o: ../src/Pathogen.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.o -c /home/piotr/CodeProjects/MhcEvo2000/src/Pathogen.cpp

CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/CodeProjects/MhcEvo2000/src/Pathogen.cpp > CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.i

CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/CodeProjects/MhcEvo2000/src/Pathogen.cpp -o CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.s

CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.o: ../src/Random.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.o -c /home/piotr/CodeProjects/MhcEvo2000/src/Random.cpp

CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/CodeProjects/MhcEvo2000/src/Random.cpp > CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.i

CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/CodeProjects/MhcEvo2000/src/Random.cpp -o CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.s

CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.o: ../src/Tagging_system.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.o -c /home/piotr/CodeProjects/MhcEvo2000/src/Tagging_system.cpp

CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/CodeProjects/MhcEvo2000/src/Tagging_system.cpp > CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.i

CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/CodeProjects/MhcEvo2000/src/Tagging_system.cpp -o CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.s

# Object files for target MHC_code_OBA
MHC_code_OBA_OBJECTS = \
"CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/main.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.o"

# External object files for target MHC_code_OBA
MHC_code_OBA_EXTERNAL_OBJECTS =

MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/src/Antigen.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/src/DataHandler.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/src/Environment.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/src/Gene.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/src/H2Pinteraction.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/src/Host.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/main.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/src/Pathogen.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/src/Random.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/src/Tagging_system.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/build.make
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking CXX executable MHC_code_OBA"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MHC_code_OBA.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MHC_code_OBA.dir/build: MHC_code_OBA

.PHONY : CMakeFiles/MHC_code_OBA.dir/build

CMakeFiles/MHC_code_OBA.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MHC_code_OBA.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MHC_code_OBA.dir/clean

CMakeFiles/MHC_code_OBA.dir/depend:
	cd /home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/piotr/CodeProjects/MhcEvo2000 /home/piotr/CodeProjects/MhcEvo2000 /home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug /home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug /home/piotr/CodeProjects/MhcEvo2000/cmake-build-debug/CMakeFiles/MHC_code_OBA.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MHC_code_OBA.dir/depend

