package {

import net.flashpunk.Engine;
import net.flashpunk.FP;

import worlds.GameWorld;

[SWF(width="800", height="600")]

public class FlashPunkRecord extends Engine
{
	public function FlashPunkRecord()
	{
        super(800, 600);
    }

	override public function init():void
	{
		super.init();
		FP.world = new GameWorld();
	}
}
}
