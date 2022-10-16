package;

import flixel.FlxG;
import flixel.FlxGame;
import game.FPS_Mem.CDevFPSMem;
import openfl.display.Sprite;

class Main extends Sprite
{
	var fps_mem:CDevFPSMem;
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, states.LoadingState));
		fps_mem = new CDevFPSMem(10, 10, 0xffffff, true);
		addChild(fps_mem);
		FlxG.fixedTimestep = false;

		FlxG.autoPause = false;
	}
}
