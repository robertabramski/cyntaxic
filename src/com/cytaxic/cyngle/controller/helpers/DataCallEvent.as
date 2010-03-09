package com.cytaxic.cyngle.controller.helpers
{
	import com.cytaxic.cyngle.controller.vos.DataCallVO;
	
	import flash.events.Event;

	public class DataCallEvent extends Event
	{
		public static const TIMEOUT:String = "timeout";
		public static const COMPLETE:String = "complete";
		public static const IO_ERROR:String = "ioError";
		
		private var _data:DataCallVO;
		
		public function DataCallEvent(type:String, data:DataCallVO = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			_data = data;
			super(type, bubbles, cancelable);
		}
		
		public function get data():DataCallVO
		{
			return _data;
		}
	}
}