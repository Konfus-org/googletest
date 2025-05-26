project "googletest"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "Off"

    flags
    {
        "MultiProcessorCompile"
    }

    if OutputIntermediateDir == nil or OutputTargetDir == nil then
        targetdir ("Build/bin/%{prj.name}/")
        objdir    ("Build/obj/%{prj.name}/")
    else
        targetdir ("../../../" .. OutputTargetDir .. "")
        objdir    ("../../../" .. OutputIntermediateDir .. "")
    end

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

    filter "configurations:Debug"
        runtime "Debug"
        buildoptions { "/MDd" }
        symbols "on"

    filter "configurations:Optimized"
        runtime "Release"
        buildoptions { "/MDd" }
        optimize "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        buildoptions { "/MD" }
        symbols "off"