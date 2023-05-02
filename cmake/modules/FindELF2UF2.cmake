
if (NOT ELF2UF2_FOUND)
    set(__FND_SDK_TOOLS_PICO_SDK_PATH $ENV{PICO_SDK_PATH})

    set(ELF2UF2_TARGET ELF2UF2)

    find_program(ELF2UF2_EXECUTABLE
        NAMES
            elf2uf2
            elf2uf2.exe
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

    if(EXISTS ${ELF2UF2_EXECUTABLE})
        message(STATUS "ELF2UF2_EXECUTABLE: ${ELF2UF2_EXECUTABLE}")
        if(NOT TARGET ${ELF2UF2_TARGET})
            add_executable(${ELF2UF2_TARGET} IMPORTED)
        endif()
        set_property(TARGET ${ELF2UF2_TARGET} PROPERTY IMPORTED_LOCATION
                        ${ELF2UF2_EXECUTABLE})
        set(ELF2UF2_FOUND TRUE)
    else()
        set(ELF2UF2_FOUND FALSE)
    endif()

endif()


