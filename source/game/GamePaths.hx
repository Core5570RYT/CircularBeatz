package game;

import modding.ModPaths;
import sys.io.File;
import openfl.display.BitmapData;
import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenFlAssets;
// import sys.io.File;
#if sys
import sys.FileSystem;
#end
import flash.media.Sound;

class GamePaths
{
    public static function getPath(file:String, type:AssetType, ?library:Null<String> = null)
        {
            if (library != null)
                return getLibraryPath(file, library);
    
            if (currentLevel != null)
            {
                var levelPath:String = '';
                if (currentLevel != 'shared')
                {
                    levelPath = getLibraryPathForce(file, currentLevel);
                    if (OpenFlAssets.exists(levelPath, type))
                        return levelPath;
                }
    
                levelPath = getLibraryPathForce(file, "shared");
                if (OpenFlAssets.exists(levelPath, type))
                    return levelPath;
            }
    
            return getPreloadPath(file);
        }
    
        static public function getLibraryPath(file:String, library = "preload")
        {
            return if (library == "preload" || library == "default") getPreloadPath(file); else getLibraryPathForce(file, library);
        }
    
        inline static function getLibraryPathForce(file:String, library:String)
        {
            return '$library:assets/$library/$file';
        }
    
        inline static public function getPreloadPath(file:String)
        {
            return 'assets/$file';
        }
        
	public static inline function images(key:String){
        return "assets/images/" + key + ".png";
    }

    public static inline function music(key:String){
        return "assets/music/"+key+".ogg";
    }
}
