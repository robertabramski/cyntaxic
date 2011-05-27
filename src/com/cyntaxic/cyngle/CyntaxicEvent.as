package com.cyntaxic.cyngle
{
	import flash.events.Event;
	import flash.utils.describeType;

	public class CyntaxicEvent extends Event
	{
		private var _handle:String;
		private var _vo:CyntaxicVO;
		
		public static const NOTIFY:String = "notify";
		
		public function CyntaxicEvent(handle:String, vo:CyntaxicVO, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			_handle = handle;
			_vo = vo;
			
			super(NOTIFY, bubbles, cancelable);
		}
		
		public function get handle():String 
		{
			return _handle;
		}

		public function set handle(value:String):void
		{
			_handle = value;
		}

		public function get vo():CyntaxicVO 
		{
			return _vo;
		}

		public function set vo(value:CyntaxicVO):void 
		{
			_vo = value;
		}
		
		public function describe(compact:Boolean = true):String
		{
			return Cyntaxic.describe(this, compact);
		}
	}
}