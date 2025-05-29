project "googlemock"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "Off"

    files
    {
        "./src/gmock-all.cc",
        "./src/gmock_main.cc",
        "./include/**.h",
        "./**.md",
        "./**.lua"
    }
    includedirs
    {
        "./",
        "./include",
        "../googletest/",
        "../googletest/include"
    }
    links
    {
        "googletest"
    }