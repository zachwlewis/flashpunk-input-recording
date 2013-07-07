/**
 * Created with IntelliJ IDEA.
 * User: zachwlewis
 * Date: 7/6/13
 * Time: 8:46 PM
 * To change this template use File | Settings | File Templates.
 */
package worlds {
import entities.InputEntity;

import flash.display.BitmapData;

import net.flashpunk.FP;

import net.flashpunk.World;
import net.flashpunk.graphics.Image;
import net.flashpunk.graphics.Text;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;

import tools.recordings.KeyRecord;

import tools.recordings.RecordedInput;

public class GameWorld extends World {

	protected var _player:InputEntity;
	protected var _ghost:InputEntity;
	protected var _recording:RecordedInput;
	protected var _replayTimestamp:Number;
	protected var _playbackRecording:KeyRecord;

	public function GameWorld() {
		super();

		_recording = new RecordedInput();
		_playbackRecording = null;
	}

	override public function begin():void
	{
		_player = new InputEntity(400, 300, new Image(new BitmapData(32, 32, true, 0xffffffff)));
		_ghost = new InputEntity(400, 300, new Image(new BitmapData(32, 32, true, 0x88ffffff)));
		add(_player);
		add(_ghost);

		addGraphic(new Text("Move with the arrow keys.\nLeave the screen to view ghost replay."));

		reset();
	}

	override public function update():void
	{
		_recording.update(FP.elapsed);

		replayRecording(FP.elapsed);

		checkInput(Key.UP);
		checkInput(Key.DOWN);
		checkInput(Key.LEFT);
		checkInput(Key.RIGHT);

		// test for screen reset
		if (_player.x > FP.screen.width || _player.x < -32 || _player.y > FP.screen.height || _player.y < -32)
		{
			// The player is off screen
			reset();
		}

		super.update();
	}

	protected function replayRecording(deltaTime:Number):void
	{
		_replayTimestamp += deltaTime;

		while(_playbackRecording != null && _playbackRecording.timestamp <= _replayTimestamp)
		{
			_ghost.takeInput(_playbackRecording.key);
			_playbackRecording = _playbackRecording.nextRecord;
		}

	}

	protected function reset():void
	{
		_replayTimestamp = 0;
		_player.x = 400;
		_player.y = 300;
		_ghost.x = 400;
		_ghost.y = 300;
		_playbackRecording = _recording.firstItem;
		_recording = new RecordedInput();
	}

	protected function checkInput(key:uint):void
	{
		if (Input.check(key))
		{
			_player.takeInput(key);
			_recording.addInput(key);
		}
	}
}
}
