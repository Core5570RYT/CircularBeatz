package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import music.MusicState;
import game.GamePaths;

class GameTitle extends MusicState
{
    var white:FlxSprite;
	var gameLogo:FlxSprite;
	override function create()
	{
		super.create();
        white = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
        add(white);

		gameLogo = new FlxSprite().loadGraphic(GamePaths.images('defaultLogo'));
		add(gameLogo);
		gameLogo.scale.set(0.3,0.3);
		gameLogo.updateHitbox();

		FlxG.sound.playMusic();
	}

	override function onBeatUpdate() {
		super.onBeatUpdate();

	}
}
