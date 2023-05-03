package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var halfWidth:Int = Math.floor(FlxG.width / 2);
		var quarterWidth:Int = Math.floor(FlxG.width / 4);

		var leftSide:FlxSprite = new FlxSprite();
		leftSide.makeGraphic(halfWidth, FlxG.height, 0xffaaeeaa);

		var rightSide:FlxSprite = new FlxSprite(FlxG.width / 2.0, 0);
		rightSide.makeGraphic(halfWidth, FlxG.height, 0xffeeaaaa);

		var widthOffset:Int = Math.ceil(FlxG.width / 8);
		var heightOffset:Int = Math.floor((FlxG.height - quarterWidth) / 2);

		var leftSquare:FlxSprite = new FlxSprite(widthOffset, heightOffset);
		leftSquare.makeGraphic(quarterWidth, quarterWidth, 0xff558855);

		var rightSquare:FlxSprite = new FlxSprite(halfWidth + widthOffset, heightOffset);
		rightSquare.makeGraphic(quarterWidth, quarterWidth, 0xff885555);

		add(leftSide);
		add(rightSide);
		add(leftSquare);
		add(rightSquare);

		// Force default camera to be only camera for above game objects
		cameras = [camera];

		// Place smaller camera on top with smaller zoom
		var smallerZoomCam:FlxCamera = new FlxCamera(widthOffset, heightOffset, FlxG.width, FlxG.width, 0.25);
		smallerZoomCam.bgColor = 0;

		// Draw sprite only for smaller camera
		var leftSquareForCamera:FlxSprite = new FlxSprite(0, 0);
		leftSquareForCamera.makeGraphic(FlxG.width, FlxG.width, 0xff773377);
		leftSquareForCamera.cameras = [smallerZoomCam];
		add(leftSquareForCamera);

		// Place smaller camera on top with smaller zoom
		var smallerZoomCamFixed:FlxCameraFixed = new FlxCameraFixed(halfWidth + widthOffset, heightOffset, FlxG.width, FlxG.width, 0.25);
		smallerZoomCamFixed.bgColor = 0;

		// Draw sprite only for smaller camera
		var rightSquareForCamera:FlxSprite = new FlxSprite(0, 0);
		rightSquareForCamera.makeGraphic(FlxG.width, FlxG.width, 0xff337777);
		rightSquareForCamera.cameras = [smallerZoomCamFixed];
		add(rightSquareForCamera);

		// Add smaller camera
		FlxG.cameras.add(smallerZoomCam);
		FlxG.cameras.add(smallerZoomCamFixed);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
