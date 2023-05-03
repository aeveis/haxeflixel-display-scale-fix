# haxeflixel-display-scale-fix
example project to show display scale bug

## Context
On PC where the OS display scale is set to >100% or on Apple Retina displays, and if cameras' x are set to >0, the scroll rect for the camera will display incorrectly. This will lead to instances where the camera will get cropped.
![game camera is cropped due to display scale](https://github.com/aeveis/haxeflixel-display-scale-fix/blob/docs/diacombs_example.gif?raw=true)

## Demo
See demo here: https://aeveis.github.io/haxeflixel-display-scale-fix/
The demo will show a green half with a purple square in the center and a red half with a teal square in the center.
The purple and teal squares are cameras set to a zoom of 0.25 and placed on top of darker green and red squares.
If your display scale is >100%, the purple square will be cropped, while the teal square with the fixed camera should be fine.

![demo showing cut off camera](https://github.com/aeveis/haxeflixel-display-scale-fix/blob/docs/demo_example.gif?raw=true)

### Notes
Originally discussed in Haxe discord: https://discord.com/channels/162395145352904705/1096838175248351283
