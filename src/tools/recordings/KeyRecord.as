package tools.recordings
{
	/**
	 * A recorded key.
	 * @author Zachary Lewis
	 * @see <a href="http://zacharylew.is">zacharylew.is</a>
	 */
	public class KeyRecord extends Object
	{
		protected var _key:uint;
		protected var _timestamp:Number;
		protected var _nextRecord:KeyRecord;

		public function get key():uint { return _key; }
		public function get timestamp():Number { return _timestamp; }
		public function get nextRecord():KeyRecord { return _nextRecord; }

		
		public function KeyRecord(key:uint, timestamp:Number)
		{
			_key = key;
			_timestamp = timestamp;
			_nextRecord = null;
		}

		public function setNextRecord(nextRecord:KeyRecord):void
		{
			_nextRecord = nextRecord;
		}
	}
}
