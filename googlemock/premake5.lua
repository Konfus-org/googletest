project "googlemock"
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
    
    filter "configurations:Debug"
        runtime "Debug"
        buildoptions { "/MDd" } 
        symbols "On"

    filter "configurations:Optimized"
        runtime "Release"
        buildoptions { "/MDd" } 
        optimize "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        buildoptions { "/MD" } 
        symbols "Off"