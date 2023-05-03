import flixel.FlxCamera;
import flixel.FlxG;
import openfl.geom.Rectangle;

class FlxCameraFixed extends FlxCamera
{
	override function updateScrollRect()
	{
		var rect:Rectangle = (_scrollRect != null) ? _scrollRect.scrollRect : null;

		if (rect != null)
		{
			rect.x = rect.y = 0;

			var offset:Float = 0;
			#if web
			if (x > 0)
			{
				offset = x / (2.0 * zoom);
			}
			#end

			rect.x -= offset;

			rect.width = width * initialZoom * FlxG.scaleMode.scale.x + offset;
			rect.height = height * initialZoom * FlxG.scaleMode.scale.y;

			_scrollRect.scrollRect = rect;

			_scrollRect.x = -0.5 * (rect.width + offset);
			_scrollRect.y = -0.5 * rect.height;
		}
	}
}
