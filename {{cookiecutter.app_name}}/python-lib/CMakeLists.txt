execute_process(
    COMMAND dpkg-architecture -qDEB_HOST_MULTIARCH
    OUTPUT_VARIABLE ARCH_TRIPLET
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(LIB_DIR "/lib/${ARCH_TRIPLET}")

install(DIRECTORY io DESTINATION ${LIB_DIR})
install(FILES libpython3.4m.so.1 libpython3.4m.so.1.0 DESTINATION ${LIB_DIR})
