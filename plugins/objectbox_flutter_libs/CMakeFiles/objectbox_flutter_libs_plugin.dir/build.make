# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/cmake/1035/bin/cmake

# The command to remove a file.
RM = /snap/cmake/1035/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tarith/AndroidStudioProjects/cash_leaf/linux

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tarith/AndroidStudioProjects/cash_leaf

# Include any dependencies generated for this target.
include plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/compiler_depend.make

# Include the progress variables for this target.
include plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/progress.make

# Include the compile flags for this target's objects.
include plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/flags.make

plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.o: plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/flags.make
plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.o: linux/flutter/ephemeral/.plugin_symlinks/objectbox_flutter_libs/linux/objectbox_flutter_libs_plugin.cc
plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.o: plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tarith/AndroidStudioProjects/cash_leaf/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.o"
	cd /home/tarith/AndroidStudioProjects/cash_leaf/plugins/objectbox_flutter_libs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.o -MF CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.o.d -o CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.o -c /home/tarith/AndroidStudioProjects/cash_leaf/linux/flutter/ephemeral/.plugin_symlinks/objectbox_flutter_libs/linux/objectbox_flutter_libs_plugin.cc

plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.i"
	cd /home/tarith/AndroidStudioProjects/cash_leaf/plugins/objectbox_flutter_libs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tarith/AndroidStudioProjects/cash_leaf/linux/flutter/ephemeral/.plugin_symlinks/objectbox_flutter_libs/linux/objectbox_flutter_libs_plugin.cc > CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.i

plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.s"
	cd /home/tarith/AndroidStudioProjects/cash_leaf/plugins/objectbox_flutter_libs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tarith/AndroidStudioProjects/cash_leaf/linux/flutter/ephemeral/.plugin_symlinks/objectbox_flutter_libs/linux/objectbox_flutter_libs_plugin.cc -o CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.s

# Object files for target objectbox_flutter_libs_plugin
objectbox_flutter_libs_plugin_OBJECTS = \
"CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.o"

# External object files for target objectbox_flutter_libs_plugin
objectbox_flutter_libs_plugin_EXTERNAL_OBJECTS =

plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/objectbox_flutter_libs_plugin.cc.o
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/build.make
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: _deps/objectbox-download-src/lib/libobjectbox.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: linux/flutter/ephemeral/libflutter_linux_gtk.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libgtk-3.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libgdk-3.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libpangocairo-1.0.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libpango-1.0.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libharfbuzz.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libatk-1.0.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libcairo-gobject.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libcairo.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libgio-2.0.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libgobject-2.0.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: /usr/lib/x86_64-linux-gnu/libglib-2.0.so
plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so: plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tarith/AndroidStudioProjects/cash_leaf/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libobjectbox_flutter_libs_plugin.so"
	cd /home/tarith/AndroidStudioProjects/cash_leaf/plugins/objectbox_flutter_libs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/objectbox_flutter_libs_plugin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/build: plugins/objectbox_flutter_libs/libobjectbox_flutter_libs_plugin.so
.PHONY : plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/build

plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/clean:
	cd /home/tarith/AndroidStudioProjects/cash_leaf/plugins/objectbox_flutter_libs && $(CMAKE_COMMAND) -P CMakeFiles/objectbox_flutter_libs_plugin.dir/cmake_clean.cmake
.PHONY : plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/clean

plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/depend:
	cd /home/tarith/AndroidStudioProjects/cash_leaf && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tarith/AndroidStudioProjects/cash_leaf/linux /home/tarith/AndroidStudioProjects/cash_leaf/linux/flutter/ephemeral/.plugin_symlinks/objectbox_flutter_libs/linux /home/tarith/AndroidStudioProjects/cash_leaf /home/tarith/AndroidStudioProjects/cash_leaf/plugins/objectbox_flutter_libs /home/tarith/AndroidStudioProjects/cash_leaf/plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : plugins/objectbox_flutter_libs/CMakeFiles/objectbox_flutter_libs_plugin.dir/depend

