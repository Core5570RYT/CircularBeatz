package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;

class LoadingState extends FlxState
{
    var blackthing:FlxSprite;
    var bar:FlxBar;
    private var loadingProgress:Float = 0;
    var aaa:FlxText;
	override function create()
	{
		var bg:FlxSprite = FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [FlxColor.WHITE, FlxColor.CYAN], 1, 90, true);
		add(bg);
		bg.alpha = 1;
		
		aaa = new FlxText(0, 0, 0, 'Loading Game...', 20);
        aaa.color = FlxColor.BLUE;
		aaa.screenCenter();
		add(aaa);
		blackthing = new FlxSprite(0,FlxG.height*0.65).makeGraphic(600,20);
		blackthing.screenCenter(X);
		blackthing.scrollFactor.set();
		add(blackthing);
		bar = new FlxBar(blackthing.x + 4, blackthing.y + 4, LEFT_TO_RIGHT, Std.int((blackthing.width) - 8), Std.int(blackthing.height - 8), this, 'loadingProgress', 0, 2);
        bar.scrollFactor.set();
        bar.numDivisions = 3000;
        bar.screenCenter(X);
        bar.createFilledBar(FlxColor.BLACK, FlxColor.WHITE);
		add(bar);

		super.create();
	}

    var swing:Float = 0;
	override function update(elapsed:Float)
	{
		super.update(elapsed);
        if (bar.percent < 99){
            aaa.text = "Loading Data... " + bar.percent+"%";
        }else{
            aaa.text = "Data Loaded.";
            aaa.screenCenter();
            aaa.color = FlxColor.CYAN;
            blackthing.visible = false;
            bar.visible = false;
            swing += elapsed;
            if (swing > 3){
                FlxG.switchState(new GameTitle());
            }
        }
        loadingProgress += elapsed/6;     
	}
}
