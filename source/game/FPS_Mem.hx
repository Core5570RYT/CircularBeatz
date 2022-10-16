package game;
//using fnf cdev engine's code :3

import flixel.FlxG;
import flixel.system.scaleModes.BaseScaleMode;
import flixel.system.scaleModes.StageSizeScaleMode;
import flixel.util.FlxColor;
import haxe.Timer;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.DisplayObject;
import openfl.display.FPS;
import openfl.display.Stage;
import openfl.events.Event;
import openfl.events.EventType;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.TextFormat;

class CDevFPSMem extends TextField
{
	public var times:Array<Float>;

	public function new(inX:Float = 10.0, inY:Float = 10.0, inCol:Int = 0x000000, bold:Bool = false)
	{
		super();
		x = inX;
		y = inY;
		selectable = false;
		defaultTextFormat = new TextFormat("_sans", 12, inCol, false);
		text = "FPS: ";
		times = [];
	    addEventListener(Event.ENTER_FRAME, onEnter);
		width = 170;
		height = 70;
	}

	private function onEnter(_)
	{
		var now = Timer.stamp();

		times.push(now);

		while (times[0] < now - 1)
			times.shift();

		var mem:Float = Math.round(System.totalMemory / 1024 / 1024 * 100) / 100;
		var ramStr:String = '';
		if (mem >= 1024)
			ramStr = Math.round(mem / 1024) + ' GB';
		else
			ramStr = mem + ' MB';
		
		if (mem >= 2048){
			openfl.Assets.cache.clear();
			FlxG.save.flush();
		}
		
		if (visible)
		{
			text = "FPS: " + times.length + "\nRAM: " + ramStr;
		}

		if (times.length < 30){
			textColor = 0xFF0000;
		} else{
			textColor = 0xFFFFFF;
		}
	}
}
