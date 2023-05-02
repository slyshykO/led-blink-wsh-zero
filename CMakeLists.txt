cmake_minimum_required(VERSION 3.12)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)



# Pull in SDK (must be before project)
include(pico_sdk_import.cmake)

project(pico-led C CXX ASM)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

set(SRC_LIST src/main.cpp)

# Add executable. Default name is the project name, version 0.1
add_executable(${PROJECT_NAME} ${SRC_LIST})

pico_generate_pio_header(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/src/ws2812.pio OUTPUT_DIR ${CMAKE_CURRENT_BUILD_DIR}/generated)

pico_set_program_name(${PROJECT_NAME} "led-blink-wsh-zero")
pico_set_program_version(${PROJECT_NAME} "0.1")

pico_enable_stdio_uart(${PROJECT_NAME} 0)
pico_enable_stdio_usb(${PROJECT_NAME} 0)

# Add the standard library to the build
target_link_libraries(${PROJECT_NAME} pico_stdlib)

# Add any user requested libraries
target_link_libraries(${PROJECT_NAME} hardware_pio)

pico_add_uf2_output(${PROJECT_NAME})