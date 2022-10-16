package music;

typedef BPMChangeMap =
{
	var position:Float;
	var step:Int;
	var bpm:Float;
}

class Metronome
{
	public static var bpmChangeList:Array<BPMChangeMap> = [];
    public static var bpm:Float = 100;
	public static var position:Float;
	public static var beat_ms:Float = ((60/bpm)*1000);
	public static var step_ms:Float = beat_ms/4;

	public static function parseBPMChangesFromSong() {
		
	}

	public static function change_bpm(newBpm:Float)
	{
		bpm = newBpm;

		beat_ms = ((60/bpm)*1000);
		step_ms = beat_ms/4;
	}
}