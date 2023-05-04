package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var halfWidth:Int;
	public var quarterWidth:Int;
	public var eightWidth:Int;
	public var smallOffset:Int;
	public var counter:Float = 0;
	public var leftSquare:FlxSprite;
	public var rightSquare:FlxSprite;
	public var zoomCam:FlxCamera;
	public var zoomCamFixed:FlxCamera;
	public var leftSmallSquare0:FlxSprite;
	public var leftSmallSquare1:FlxSprite;
	public var leftSmallSquare2:FlxSprite;
	public var leftSmallSquare3:FlxSprite;
	public var rightSmallSquare0:FlxSprite;
	public var rightSmallSquare1:FlxSprite;
	public var rightSmallSquare2:FlxSprite;
	public var rightSmallSquare3:FlxSprite;
	public var sZoomCam0:FlxCamera;
	public var sZoomCam1:FlxCamera;
	public var sZoomCam2:FlxCamera;
	public var sZoomCam3:FlxCamera;
	public var sZoomCamFixed0:FlxCamera;
	public var sZoomCamFixed1:FlxCamera;
	public var sZoomCamFixed2:FlxCamera;
	public var sZoomCamFixed3:FlxCamera;

	override public function create()
	{
		super.create();
		// Force default camera to be only camera for game objects
		camera.bgColor = 0xffaffffd;
		cameras = [camera];

		halfWidth = Math.floor(FlxG.width / 2);
		quarterWidth = Math.floor(FlxG.width / 4);
		eightWidth = Math.floor(FlxG.width / 8);
		smallOffset = Math.floor(FlxG.width / 32);

		var widthOffset:Int = Math.floor(FlxG.width / 8);
		var heightOffset:Int = Math.floor((FlxG.height - quarterWidth) / 2);

		leftSquare = new FlxSprite(widthOffset, heightOffset);
		leftSquare.loadGraphic(AssetPaths.checker_red__png);

		rightSquare = new FlxSprite(halfWidth + widthOffset, heightOffset);
		rightSquare.loadGraphic(AssetPaths.checker_red__png);

		// Place smaller camera on top with smaller zoom
		zoomCam = new FlxCamera(widthOffset, heightOffset, eightWidth, eightWidth, 1);
		zoomCam.bgColor = 0;
		// Place smaller camera on top with smaller zoom
		zoomCamFixed = new FlxCamera(halfWidth + widthOffset, heightOffset, eightWidth, eightWidth, 1);
		zoomCamFixed.bgColor = 0;

		leftSmallSquare0 = new FlxSprite(smallOffset, smallOffset);
		leftSmallSquare0.loadGraphic(AssetPaths.checker_red__png);
		leftSmallSquare1 = new FlxSprite(halfWidth - eightWidth - smallOffset, smallOffset);
		leftSmallSquare1.loadGraphic(AssetPaths.checker_red__png);
		leftSmallSquare2 = new FlxSprite(smallOffset, FlxG.height - eightWidth - smallOffset);
		leftSmallSquare2.loadGraphic(AssetPaths.checker_red__png);
		leftSmallSquare3 = new FlxSprite(halfWidth - eightWidth - smallOffset, FlxG.height - eightWidth - smallOffset);
		leftSmallSquare3.loadGraphic(AssetPaths.checker_red__png);

		rightSmallSquare0 = new FlxSprite(halfWidth + smallOffset, smallOffset);
		rightSmallSquare0.loadGraphic(AssetPaths.checker_red__png);
		rightSmallSquare1 = new FlxSprite(FlxG.width - eightWidth - smallOffset, smallOffset);
		rightSmallSquare1.loadGraphic(AssetPaths.checker_red__png);
		rightSmallSquare2 = new FlxSprite(halfWidth + smallOffset, FlxG.height - eightWidth - smallOffset);
		rightSmallSquare2.loadGraphic(AssetPaths.checker_red__png);
		rightSmallSquare3 = new FlxSprite(FlxG.width - eightWidth - smallOffset, FlxG.height - eightWidth - smallOffset);
		rightSmallSquare3.loadGraphic(AssetPaths.checker_red__png);

		// Place smaller camera on top with smaller zoom
		sZoomCam0 = new FlxCamera(smallOffset, smallOffset, halfWidth, halfWidth, 0.25);
		sZoomCam0.bgColor = 0;
		sZoomCam1 = new FlxCamera(halfWidth - eightWidth - smallOffset, smallOffset, halfWidth, halfWidth, 0.25);
		sZoomCam1.bgColor = 0;
		sZoomCam2 = new FlxCamera(smallOffset, FlxG.height - eightWidth - smallOffset, halfWidth, halfWidth, 0.25);
		sZoomCam2.bgColor = 0;
		sZoomCam3 = new FlxCamera(halfWidth - eightWidth - smallOffset, FlxG.height - eightWidth - smallOffset, halfWidth, halfWidth, 0.25);
		sZoomCam3.bgColor = 0;

		// Place smaller camera on top with smaller zoom
		sZoomCamFixed0 = new FlxCamera(halfWidth + smallOffset, smallOffset, halfWidth, halfWidth, 0.25);
		sZoomCamFixed0.bgColor = 0;
		sZoomCamFixed1 = new FlxCamera(FlxG.width - eightWidth - smallOffset, smallOffset, halfWidth, halfWidth, 0.25);
		sZoomCamFixed1.bgColor = 0;
		sZoomCamFixed2 = new FlxCamera(halfWidth + smallOffset, FlxG.height - eightWidth - smallOffset, halfWidth, halfWidth, 0.25);
		sZoomCamFixed2.bgColor = 0;
		sZoomCamFixed3 = new FlxCamera(FlxG.width - eightWidth - smallOffset, FlxG.height - eightWidth - smallOffset, halfWidth, halfWidth, 0.25);
		sZoomCamFixed3.bgColor = 0;

		add(leftSquare);
		add(rightSquare);
		add(leftSmallSquare0);
		add(leftSmallSquare1);
		add(leftSmallSquare2);
		add(leftSmallSquare3);
		add(rightSmallSquare0);
		add(rightSmallSquare1);
		add(rightSmallSquare2);
		add(rightSmallSquare3);

		// Draw sprite only for smaller camera
		// Draw sprite bigger to see actual camera scale
		var squareForCamera:FlxSprite = new FlxSprite(0, 0, AssetPaths.checker__png);
		squareForCamera.cameras = [
			zoomCam, zoomCamFixed, sZoomCam0, sZoomCam1, sZoomCam2, sZoomCam3, sZoomCamFixed0, sZoomCamFixed1, sZoomCamFixed2, sZoomCamFixed3
		];
		add(squareForCamera);

		// Add smaller camera
		FlxG.cameras.add(zoomCam);
		FlxG.cameras.add(zoomCamFixed);
		FlxG.cameras.add(sZoomCam0);
		FlxG.cameras.add(sZoomCam1);
		FlxG.cameras.add(sZoomCam2);
		FlxG.cameras.add(sZoomCam3);
		FlxG.cameras.add(sZoomCamFixed0);
		FlxG.cameras.add(sZoomCamFixed1);
		FlxG.cameras.add(sZoomCamFixed2);
		FlxG.cameras.add(sZoomCamFixed3);
	}

	override public function update(elapsed:Float)
	{
		counter += elapsed;
		smallOffset = Math.floor(FlxG.width / 32 + FlxG.width / 8 * Math.sin(counter) + 3 * FlxG.width / 32);

		leftSmallSquare0.setPosition(smallOffset, smallOffset);
		leftSmallSquare1.setPosition(halfWidth - eightWidth - smallOffset, smallOffset);
		leftSmallSquare2.setPosition(smallOffset, FlxG.height - eightWidth - smallOffset);
		leftSmallSquare3.setPosition(halfWidth - eightWidth - smallOffset, FlxG.height - eightWidth - smallOffset);

		rightSmallSquare0.setPosition(halfWidth + smallOffset, smallOffset);
		rightSmallSquare1.setPosition(FlxG.width - eightWidth - smallOffset, smallOffset);
		rightSmallSquare2.setPosition(halfWidth + smallOffset, FlxG.height - eightWidth - smallOffset);
		rightSmallSquare3.setPosition(FlxG.width - eightWidth - smallOffset, FlxG.height - eightWidth - smallOffset);

		sZoomCam0.setPosition(smallOffset, smallOffset);
		sZoomCam1.setPosition(halfWidth - eightWidth - smallOffset, smallOffset);
		sZoomCam2.setPosition(smallOffset, FlxG.height - eightWidth - smallOffset);
		sZoomCam3.setPosition(halfWidth - eightWidth - smallOffset, FlxG.height - eightWidth - smallOffset);

		sZoomCamFixed0.setPosition(halfWidth + smallOffset, smallOffset);
		sZoomCamFixed1.setPosition(FlxG.width - eightWidth - smallOffset, smallOffset);
		sZoomCamFixed2.setPosition(halfWidth + smallOffset, FlxG.height - eightWidth - smallOffset);
		sZoomCamFixed3.setPosition(FlxG.width - eightWidth - smallOffset, FlxG.height - eightWidth - smallOffset);

		rightSquare.setPosition(Math.min(FlxG.mouse.x, FlxG.width - rightSquare.width), Math.min(FlxG.mouse.y, FlxG.height - rightSquare.height));
		zoomCam.setPosition(Math.min(FlxG.mouse.x, FlxG.width - rightSquare.width), Math.min(FlxG.mouse.y, FlxG.height - rightSquare.height));

		leftSquare.setPosition(halfWidth + Math.min(FlxG.mouse.x, FlxG.width - leftSquare.width), Math.min(FlxG.mouse.y, FlxG.height - leftSquare.height));
		zoomCamFixed.setPosition(halfWidth + Math.min(FlxG.mouse.x, FlxG.width - leftSquare.width), Math.min(FlxG.mouse.y, FlxG.height - leftSquare.height));
		super.update(elapsed);
	}
}
