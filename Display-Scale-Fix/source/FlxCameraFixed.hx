import flixel.FlxCamera;
import flixel.FlxG;
import flixel.math.FlxPoint;
import openfl.geom.Rectangle;

class FlxCameraFixed extends FlxCamera
{
	override function updateScrollRect()
	{
		var rect:Rectangle = (_scrollRect != null) ? _scrollRect.scrollRect : null;

		if (rect != null)
		{
			rect.x = rect.y = 0;

			var offset:FlxPoint = FlxPoint.get(0, 0);

			#if web
			if (x > 0)
			{
				offset.x = x / zoom;
			}
			if (y > 0)
			{
				offset.y = y / zoom;
			}
			#end

			rect.x -= offset.x;
			rect.y -= offset.y;

			rect.width = width * initialZoom * FlxG.scaleMode.scale.x + offset.x;
			rect.height = height * initialZoom * FlxG.scaleMode.scale.y + offset.y;

			_scrollRect.scrollRect = rect;

			_scrollRect.x = -0.5 * (rect.width + offset.x);
			_scrollRect.y = -0.5 * (rect.height + offset.y);

			offset.put();
		}
	}
}
