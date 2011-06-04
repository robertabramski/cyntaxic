package com.cyntaxic.cynmvc.model.helpers
{
	import com.cyntaxic.cynmvc.model.vos.DataCallVO;
	
	import flash.events.Event;

	public class DataCallEvent extends Event
	{
		public static const TIMEOUT:String = "timeout";
		public static const COMPLETE:String = "complete";
		public static const IO_ERROR:String = "ioError";
		
		private var _data:DataCallVO;
		private var _handle:String;
		
		public function DataCallEvent(type:String, handle:String, data:DataCallVO = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			_handle = handle;
			_data = data;
			
			super(type, bubbles, cancelable);
		}
		
		public function get data():DataCallVO { return _data; }
		
		public function get handle():String { return _handle; }
		public function set handle(value:String):void { _handle = value; }
	}
}