# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.3

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src

# Include any dependencies generated for this target.
include RTTL/CMakeFiles/test_newmesh.dir/depend.make

# Include the progress variables for this target.
include RTTL/CMakeFiles/test_newmesh.dir/progress.make

# Include the compile flags for this target's objects.
include RTTL/CMakeFiles/test_newmesh.dir/flags.make

RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o: RTTL/CMakeFiles/test_newmesh.dir/flags.make
RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o: RTTL/test/api_newmesh/newmesh.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o"
	cd /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/RTTL && /home/lzto/txgoto/llvm/build/bin/clang++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o -c /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/RTTL/test/api_newmesh/newmesh.cxx

RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.i"
	cd /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/RTTL && /home/lzto/txgoto/llvm/build/bin/clang++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/RTTL/test/api_newmesh/newmesh.cxx > CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.i

RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.s"
	cd /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/RTTL && /home/lzto/txgoto/llvm/build/bin/clang++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/RTTL/test/api_newmesh/newmesh.cxx -o CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.s

RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o.requires:

.PHONY : RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o.requires

RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o.provides: RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o.requires
	$(MAKE) -f RTTL/CMakeFiles/test_newmesh.dir/build.make RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o.provides.build
.PHONY : RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o.provides

RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o.provides.build: RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o


# Object files for target test_newmesh
test_newmesh_OBJECTS = \
"CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o"

# External object files for target test_newmesh
test_newmesh_EXTERNAL_OBJECTS =

bin/test_newmesh: RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o
bin/test_newmesh: RTTL/CMakeFiles/test_newmesh.dir/build.make
bin/test_newmesh: lib/libRTTL.a
bin/test_newmesh: RTTL/CMakeFiles/test_newmesh.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/test_newmesh"
	cd /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/RTTL && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_newmesh.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
RTTL/CMakeFiles/test_newmesh.dir/build: bin/test_newmesh

.PHONY : RTTL/CMakeFiles/test_newmesh.dir/build

RTTL/CMakeFiles/test_newmesh.dir/requires: RTTL/CMakeFiles/test_newmesh.dir/test/api_newmesh/newmesh.o.requires

.PHONY : RTTL/CMakeFiles/test_newmesh.dir/requires

RTTL/CMakeFiles/test_newmesh.dir/clean:
	cd /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/RTTL && $(CMAKE_COMMAND) -P CMakeFiles/test_newmesh.dir/cmake_clean.cmake
.PHONY : RTTL/CMakeFiles/test_newmesh.dir/clean

RTTL/CMakeFiles/test_newmesh.dir/depend:
	cd /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/RTTL /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/RTTL /home/lzto/benchmark/parsec-3.0/pkgs/apps/raytrace/src/RTTL/CMakeFiles/test_newmesh.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : RTTL/CMakeFiles/test_newmesh.dir/depend

