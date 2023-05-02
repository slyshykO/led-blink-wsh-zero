
if (NOT Pioasm_FOUND)
    set(__FND_SDK_TOOLS_PICO_SDK_PATH $ENV{PICO_SDK_PATH})

    set(Pioasm_TARGET Pioasm)

    find_program(Pioasm_EXECUTABLE
        NAMES
            pioasm
            pioasm.exe
        HINTS
            ${CMAKE_SOURCE_DIR}
            ${__FND_SDK_TOOLS_PICO_SDK_PATH}
        PATHS

        PATH_SUFFIXES
            "bin"
            "tools/bin"

        NO_DEFAULT_PATH
        NO_CMAKE_FIND_ROOT_PATH
    )

    if(EXISTS ${Pioasm_EXECUTABLE})
        message(STATUS "Pioasm_EXECUTABLE: ${Pioasm_EXECUTABLE}")
        if(NOT TARGET ${Pioasm_TARGET})
            #message("Adding executable ${Pioasm_Target} in ${CMAKE_CURRENT_LIST_DIR}")
            add_executable(${Pioasm_TARGET} IMPORTED)
        endif()
        set_property(TARGET ${Pioasm_TARGET} PROPERTY IMPORTED_LOCATION
                        ${Pioasm_EXECUTABLE})
        set(Pioasm_FOUND TRUE)
    else()
        set(Pioasm_FOUND FALSE)
    endif()

endif()