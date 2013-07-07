/**
 * Created with IntelliJ IDEA.
 * User: zachwlewis
 * Date: 7/6/13
 * Time: 8:57 PM
 * To change this template use File | Settings | File Templates.
 */
package entities {
import flash.geom.Point;

import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.Graphic;
import net.flashpunk.Mask;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;

public class InputEntity extends Entity {

	protected var _v:Point;
	var _inputValue:Point;
	protected const SPEED:Number = 200;

	public function InputEntity(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) {
		super(x, y, graphic, mask);
		_v = new Point();
		_inputValue = new Point();
	}

	public function takeInput(key:uint):void
	{
		if (key == Key.UP) _inputValue.y--;
		if (key == Key.DOWN) _inputValue.y++;
		if (key == Key.LEFT) _inputValue.x--;
		if (key == Key.RIGHT) _inputValue.x++;
	}

	override public function update():void
	{
		_v.x = _inputValue.x * SPEED;
		_v.y = _inputValue.y * SPEED;

		x += _v.x * FP.elapsed;
		y += _v.y * FP.elapsed;

		_inputValue = new Point();

		super.update();
	}
}
}
