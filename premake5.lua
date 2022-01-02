require("premake", ">=5.0.0-alpha13")

workspace "Arcade"
    architecture "x64"
    configurations { "Debug", "Release", "Dist" }
    startproject "Pacman"

    outputdir = "%{cfg.system}/%{cfg.architecture}/%{cfg.buildcfg}"

    include "Pacman"
