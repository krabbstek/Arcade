project "Pacman"
    kind "ConsoleApp"
    language "C++"
    staticruntime "Off"

    systemversion "latest"
    cppdialect "C++17"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "*.h",
        "*.cpp",
    }

    includedirs {
        "%{prj.location}",
    }

    filter "configurations:Debug"
        buildoptions "/MDd"
        symbols "On"

    filter "configurations:Release"
        buildoptions "/MD"
        optimize "On"

    filter "configurations:Dist"
        buildoptions "/MD"
        optimize "Full"
