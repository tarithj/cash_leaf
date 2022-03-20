# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.22.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(objectbox-download-populate NONE)



include(ExternalProject)
ExternalProject_Add(objectbox-download-populate
                     "UPDATE_DISCONNECTED" "False" "URL" "https://github.com/objectbox/objectbox-c/releases/download/v0.15.2/objectbox-linux-x64.tar.gz"
                    SOURCE_DIR          "/home/tarith/AndroidStudioProjects/cash_leaf/_deps/objectbox-download-src"
                    BINARY_DIR          "/home/tarith/AndroidStudioProjects/cash_leaf/_deps/objectbox-download-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)


