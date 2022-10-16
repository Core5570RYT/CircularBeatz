package music;

import Metronome.BPMChangeMap;
import flixel.addons.ui.FlxUIState;

class MusicState extends FlxUIState
{
	private var lastBeat:Float = 0;
	private var lastStep:Float = 0;

	private var musicStep:Int = 0;
	private var musicBeat:Int = 0;

	override function create()
	{
		super.create();
	}

	override function update(elapsed:Float)
	{
		var prevStep:Int = musicStep;

		updateStep();
		updateBeat();

		if (prevStep != musicStep && musicStep > 0)
			onStepUpdate();

		super.update(elapsed);
	}

	private function updateStep():Void
	{
		var change:BPMChangeMap = {
			step: 0,
			position: 0,
			bpm: 0
		}
		for (i in 0...Metronome.bpmChangeList.length)
		{
			if (Metronome.position >= Metronome.bpmChangeList[i].position)
				change = Metronome.bpmChangeList[i];
		}

		musicStep = change.step + Math.floor((Metronome.position - change.position) / Metronome.step_ms);
	}

	private function updateBeat():Void
	{
		musicBeat = Math.floor(musicStep / 4);
	}

	public function onStepUpdate():Void
	{
		if (musicStep % 4 == 0)
			onBeatUpdate();
	}

	public function onBeatUpdate():Void {}
}
