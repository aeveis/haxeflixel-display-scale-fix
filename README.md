# haxeflixel-display-scale-fix
example project to show display scale bug.

## Context
For html5 targets, on PC where the OS display scale is set to >100% or on Apple Retina displays, and when the camera's x value are set to >0, the scroll rect for the camera will display incorrectly. This will lead to instances where the camera will get cropped. This potentially happens due to the browser reporting a smaller width of the game window.

![game camera is cropped due to display scale](https://github.com/aeveis/haxeflixel-display-scale-fix/blob/main/docs/diacombs_example.png)

## Demo
See demo here: https://aeveis.github.io/haxeflixel-display-scale-fix/

1. The demo will show some checkboard squares. If your display resolution is greater than 100%, you will see red squares below.

![demo showing cut off camera](https://github.com/aeveis/haxeflixel-display-scale-fix/blob/main/docs/demo_example.png)

## Fix

The fix is relatively simple after much investigation: Simply have the allow-high-dpi flag set to false in your project.xml:
- `<window if="html5" allow-high-dpi="false" />`


### Notes
Originally discussed in Haxe discord: https://discord.com/channels/162395145352904705/1096838175248351283
