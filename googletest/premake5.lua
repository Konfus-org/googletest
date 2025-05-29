project "googletest"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "Off"

    files
    {
        "./src/gtest-all.cc",
        "./src/gtest_main.cc",
        "./include/**.h",
        "./**.md",
        "./**.lua"
    }
    includedirs
    {
        "./",
        "./include"
    }