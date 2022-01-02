project "Pacman"
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
        "%{wks.location}/Dependencies/SDL2/include",
        "%{wks.location}/Dependencies/SDL2_image/include",
    }

    links {
        "SDL2.lib",
        "SDL2_image.lib",
    }

    defines {
        "SDL_MAIN_HANDLED",
    }

    filter "architecture:x86"
        libdirs {
            "%{wks.location}/Dependencies/SDL2/lib/x86",
            "%{wks.location}/Dependencies/SDL2_image/lib/x86",
        }

    filter "architecture:x64"
        libdirs {
            "%{wks.location}/Dependencies/SDL2/lib/x64",
            "%{wks.location}/Dependencies/SDL2_image/lib/x64",
        }

    filter { "system:windows", "architecture:x86" }
        postbuildcommands {
            ("{COPY} %{wks.location}/Dependencies/SDL2/lib/x86/SDL2.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x86/libjpeg-9.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x86/libpng16-16.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x86/libtiff-5.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x86/libwebp-7.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x86/SDL2_image.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x86/zlib1.dll %{cfg.targetdir}"),
        }

    filter { "system:windows", "architecture:x64" }
        postbuildcommands {
            ("{COPY} %{wks.location}/Dependencies/SDL2/lib/x64/SDL2.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x64/libjpeg-9.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x64/libpng16-16.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x64/libtiff-5.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x64/libwebp-7.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x64/SDL2_image.dll %{cfg.targetdir}"),
            ("{COPY} %{wks.location}/Dependencies/SDL2_image/lib/x64/zlib1.dll %{cfg.targetdir}"),
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
