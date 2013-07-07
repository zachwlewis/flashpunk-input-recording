package tools.recordings
{
	import net.flashpunk.utils.Input;

	/**
	 * Records input and saves it with a timestamp.
	 * @author Zachary Lewis
	 * @see <a href="http://zacharylew.is">zacharylew.is</a>
	 */
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

		/**
		 * Updates the RecordedInput to keep the recording in sync.
		 * @param	deltaTime The time elapsed since the last update (in seconds).
		 */
		public function update(deltaTime:Number):void
		{
			_currentTimestamp += deltaTime;
		}

		/**
		 * Adds an input to the recording.
		 * @param	key The value of the key to record.
		 */
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
