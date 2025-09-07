project "Assimp"
	kind "StaticLib"
	language "C++"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"code/**.cpp",
        "code/**.c",
        "include/**.h",
        "include/**.hpp"
	}

    includedirs {
        "include",
        "code",
        "contrib/zlib",       -- if ASSIMP_BUILD_ZLIB=ON
        "contrib/draco/src"   -- if ASSIMP_BUILD_DRACO=ON
    }


	filter "system:linux"
		pic "On"
		systemversion "latest"
		
		
		defines
		{
			"ASSIMP_BUILD_NO_OWN_ZLIB"
		}

	filter "system:windows"
		systemversion "latest"
        defines
        {
            "_CRT_SECURE_NO_WARNINGS"
        }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
        defines { "DEBUG" }

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
        defines { "DEBUG" }

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
        defines { "DEBUG" }