/**
 * Created with IntelliJ IDEA.
 * User: zachwlewis
 * Date: 7/6/13
 * Time: 8:53 PM
 * To change this template use File | Settings | File Templates.
 */
package tools.recordings {
import net.flashpunk.utils.Input;

public class RecordedInput {
	protected var _currentRecord:KeyRecord;
	protected var _currentTimestamp:Number;
	protected var _firstItem:KeyRecord;

	/** The first item in the recording. */
	public function get firstItem():KeyRecord { return _firstItem; }

	public function RecordedInput() {
		_currentTimestamp = 0;
		_currentRecord = null;
		_firstItem = null;
	}

	public function update(deltaTime:Number):void
	{
		_currentTimestamp += deltaTime;
	}

	public function addInput(key:uint):void
	{
		var record:KeyRecord = new KeyRecord(key, _currentTimestamp);

		if (_firstItem == null)
		{
			// This is the first item.
			_firstItem = record;
		}

		if (_currentRecord != null)
		{
			_currentRecord.setNextRecord(record);
		}

		_currentRecord = record;
	}

}
}
