# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

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
CMAKE_COMMAND = /opt/clion-2016.2.2/bin/cmake/bin/cmake

# The command to remove a file.
RM = /opt/clion-2016.2.2/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/piotr/MHC_code_OBA

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/piotr/MHC_code_OBA/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/MHC_code_OBA.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/MHC_code_OBA.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MHC_code_OBA.dir/flags.make

CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o: ../Antigen.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o -c /home/piotr/MHC_code_OBA/Antigen.cpp

CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/MHC_code_OBA/Antigen.cpp > CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.i

CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/MHC_code_OBA/Antigen.cpp -o CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.s

CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o.requires:

.PHONY : CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o.requires

CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o.provides: CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o.requires
	$(MAKE) -f CMakeFiles/MHC_code_OBA.dir/build.make CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o.provides.build
.PHONY : CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o.provides

CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o.provides.build: CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o


CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o: ../DataHandler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o -c /home/piotr/MHC_code_OBA/DataHandler.cpp

CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/MHC_code_OBA/DataHandler.cpp > CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.i

CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/MHC_code_OBA/DataHandler.cpp -o CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.s

CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o.requires:

.PHONY : CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o.requires

CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o.provides: CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o.requires
	$(MAKE) -f CMakeFiles/MHC_code_OBA.dir/build.make CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o.provides.build
.PHONY : CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o.provides

CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o.provides.build: CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o


CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o: ../Environment.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o -c /home/piotr/MHC_code_OBA/Environment.cpp

CMakeFiles/MHC_code_OBA.dir/Environment.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/Environment.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/MHC_code_OBA/Environment.cpp > CMakeFiles/MHC_code_OBA.dir/Environment.cpp.i

CMakeFiles/MHC_code_OBA.dir/Environment.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/Environment.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/MHC_code_OBA/Environment.cpp -o CMakeFiles/MHC_code_OBA.dir/Environment.cpp.s

CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o.requires:

.PHONY : CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o.requires

CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o.provides: CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o.requires
	$(MAKE) -f CMakeFiles/MHC_code_OBA.dir/build.make CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o.provides.build
.PHONY : CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o.provides

CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o.provides.build: CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o


CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o: ../Gene.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o -c /home/piotr/MHC_code_OBA/Gene.cpp

CMakeFiles/MHC_code_OBA.dir/Gene.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/Gene.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/MHC_code_OBA/Gene.cpp > CMakeFiles/MHC_code_OBA.dir/Gene.cpp.i

CMakeFiles/MHC_code_OBA.dir/Gene.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/Gene.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/MHC_code_OBA/Gene.cpp -o CMakeFiles/MHC_code_OBA.dir/Gene.cpp.s

CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o.requires:

.PHONY : CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o.requires

CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o.provides: CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o.requires
	$(MAKE) -f CMakeFiles/MHC_code_OBA.dir/build.make CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o.provides.build
.PHONY : CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o.provides

CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o.provides.build: CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o


CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o: ../H2Pinteraction.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o -c /home/piotr/MHC_code_OBA/H2Pinteraction.cpp

CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/MHC_code_OBA/H2Pinteraction.cpp > CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.i

CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/MHC_code_OBA/H2Pinteraction.cpp -o CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.s

CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o.requires:

.PHONY : CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o.requires

CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o.provides: CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o.requires
	$(MAKE) -f CMakeFiles/MHC_code_OBA.dir/build.make CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o.provides.build
.PHONY : CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o.provides

CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o.provides.build: CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o


CMakeFiles/MHC_code_OBA.dir/Host.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/Host.cpp.o: ../Host.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/MHC_code_OBA.dir/Host.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/Host.cpp.o -c /home/piotr/MHC_code_OBA/Host.cpp

CMakeFiles/MHC_code_OBA.dir/Host.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/Host.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/MHC_code_OBA/Host.cpp > CMakeFiles/MHC_code_OBA.dir/Host.cpp.i

CMakeFiles/MHC_code_OBA.dir/Host.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/Host.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/MHC_code_OBA/Host.cpp -o CMakeFiles/MHC_code_OBA.dir/Host.cpp.s

CMakeFiles/MHC_code_OBA.dir/Host.cpp.o.requires:

.PHONY : CMakeFiles/MHC_code_OBA.dir/Host.cpp.o.requires

CMakeFiles/MHC_code_OBA.dir/Host.cpp.o.provides: CMakeFiles/MHC_code_OBA.dir/Host.cpp.o.requires
	$(MAKE) -f CMakeFiles/MHC_code_OBA.dir/build.make CMakeFiles/MHC_code_OBA.dir/Host.cpp.o.provides.build
.PHONY : CMakeFiles/MHC_code_OBA.dir/Host.cpp.o.provides

CMakeFiles/MHC_code_OBA.dir/Host.cpp.o.provides.build: CMakeFiles/MHC_code_OBA.dir/Host.cpp.o


CMakeFiles/MHC_code_OBA.dir/main.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/MHC_code_OBA.dir/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/main.cpp.o -c /home/piotr/MHC_code_OBA/main.cpp

CMakeFiles/MHC_code_OBA.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/MHC_code_OBA/main.cpp > CMakeFiles/MHC_code_OBA.dir/main.cpp.i

CMakeFiles/MHC_code_OBA.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/MHC_code_OBA/main.cpp -o CMakeFiles/MHC_code_OBA.dir/main.cpp.s

CMakeFiles/MHC_code_OBA.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/MHC_code_OBA.dir/main.cpp.o.requires

CMakeFiles/MHC_code_OBA.dir/main.cpp.o.provides: CMakeFiles/MHC_code_OBA.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/MHC_code_OBA.dir/build.make CMakeFiles/MHC_code_OBA.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/MHC_code_OBA.dir/main.cpp.o.provides

CMakeFiles/MHC_code_OBA.dir/main.cpp.o.provides.build: CMakeFiles/MHC_code_OBA.dir/main.cpp.o


CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o: ../Pathogen.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o -c /home/piotr/MHC_code_OBA/Pathogen.cpp

CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/MHC_code_OBA/Pathogen.cpp > CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.i

CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/MHC_code_OBA/Pathogen.cpp -o CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.s

CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o.requires:

.PHONY : CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o.requires

CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o.provides: CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o.requires
	$(MAKE) -f CMakeFiles/MHC_code_OBA.dir/build.make CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o.provides.build
.PHONY : CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o.provides

CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o.provides.build: CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o


CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o: ../RandomNumbs.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o -c /home/piotr/MHC_code_OBA/RandomNumbs.cpp

CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/MHC_code_OBA/RandomNumbs.cpp > CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.i

CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/MHC_code_OBA/RandomNumbs.cpp -o CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.s

CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o.requires:

.PHONY : CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o.requires

CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o.provides: CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o.requires
	$(MAKE) -f CMakeFiles/MHC_code_OBA.dir/build.make CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o.provides.build
.PHONY : CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o.provides

CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o.provides.build: CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o


CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o: CMakeFiles/MHC_code_OBA.dir/flags.make
CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o: ../Tagging_system.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o -c /home/piotr/MHC_code_OBA/Tagging_system.cpp

CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piotr/MHC_code_OBA/Tagging_system.cpp > CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.i

CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piotr/MHC_code_OBA/Tagging_system.cpp -o CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.s

CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o.requires:

.PHONY : CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o.requires

CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o.provides: CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o.requires
	$(MAKE) -f CMakeFiles/MHC_code_OBA.dir/build.make CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o.provides.build
.PHONY : CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o.provides

CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o.provides.build: CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o


# Object files for target MHC_code_OBA
MHC_code_OBA_OBJECTS = \
"CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/Host.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/main.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o" \
"CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o"

# External object files for target MHC_code_OBA
MHC_code_OBA_EXTERNAL_OBJECTS =

MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/Host.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/main.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/build.make
MHC_code_OBA: CMakeFiles/MHC_code_OBA.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking CXX executable MHC_code_OBA"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MHC_code_OBA.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MHC_code_OBA.dir/build: MHC_code_OBA

.PHONY : CMakeFiles/MHC_code_OBA.dir/build

CMakeFiles/MHC_code_OBA.dir/requires: CMakeFiles/MHC_code_OBA.dir/Antigen.cpp.o.requires
CMakeFiles/MHC_code_OBA.dir/requires: CMakeFiles/MHC_code_OBA.dir/DataHandler.cpp.o.requires
CMakeFiles/MHC_code_OBA.dir/requires: CMakeFiles/MHC_code_OBA.dir/Environment.cpp.o.requires
CMakeFiles/MHC_code_OBA.dir/requires: CMakeFiles/MHC_code_OBA.dir/Gene.cpp.o.requires
CMakeFiles/MHC_code_OBA.dir/requires: CMakeFiles/MHC_code_OBA.dir/H2Pinteraction.cpp.o.requires
CMakeFiles/MHC_code_OBA.dir/requires: CMakeFiles/MHC_code_OBA.dir/Host.cpp.o.requires
CMakeFiles/MHC_code_OBA.dir/requires: CMakeFiles/MHC_code_OBA.dir/main.cpp.o.requires
CMakeFiles/MHC_code_OBA.dir/requires: CMakeFiles/MHC_code_OBA.dir/Pathogen.cpp.o.requires
CMakeFiles/MHC_code_OBA.dir/requires: CMakeFiles/MHC_code_OBA.dir/RandomNumbs.cpp.o.requires
CMakeFiles/MHC_code_OBA.dir/requires: CMakeFiles/MHC_code_OBA.dir/Tagging_system.cpp.o.requires

.PHONY : CMakeFiles/MHC_code_OBA.dir/requires

CMakeFiles/MHC_code_OBA.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MHC_code_OBA.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MHC_code_OBA.dir/clean

CMakeFiles/MHC_code_OBA.dir/depend:
	cd /home/piotr/MHC_code_OBA/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/piotr/MHC_code_OBA /home/piotr/MHC_code_OBA /home/piotr/MHC_code_OBA/cmake-build-debug /home/piotr/MHC_code_OBA/cmake-build-debug /home/piotr/MHC_code_OBA/cmake-build-debug/CMakeFiles/MHC_code_OBA.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MHC_code_OBA.dir/depend
