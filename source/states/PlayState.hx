package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;

class PlayState extends FlxState
{
	override public function create()
	{
		var aaa:FlxText = new FlxText(0, 0, 0, 'Gay Sex\n4 keys rhythm game!', 72);
		aaa.screenCenter();
		add(aaa);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
