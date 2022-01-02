project "Pacman"
    location "Pacman"
    kind "ConsoleApp"
    language "C++"
    staticruntime "Off"

    systemversion "latest"
    cppdialect "C++17"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "**.h",
        "**.cpp",
    }

    includedirs {
        "%{prj.location}",
        "%{wks.location}/SDL2/include",
    }

    links {
        "SDL2",
    }

    defines {
        "SDL_MAIN_HANDLED",
    }

    filter "architecture:x86"
        libdirs {
            "%{wks.location}/SDL2/lib/x86",
        }

    filter "architecture:x64"
        libdirs {
            "%{wks.location}/SDL2/lib/x64",
        }

    filter { "system:windows", "architecture:x86" }
        postbuildcommands {
            ("{COPY} %{wks.location}/SDL2/lib/x86/SDL2.dll %{cfg.targetdir}"),
        }

    filter { "system:windows", "architecture:x64" }
        postbuildcommands {
            ("{COPY} %{wks.location}/SDL2/lib/x64/SDL2.dll %{cfg.targetdir}"),
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
