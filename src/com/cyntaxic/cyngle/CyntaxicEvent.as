package com.cyntaxic.cyngle
{
	import flash.events.Event;

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
		
		public function describe():String
		{
			var description:String = "";
			
			description += "{";
			description += "handle:" + this.handle;
			description += ", vo:" + this.vo.describe();
			description += ", type:" + this.type;
			description += ", bubbles:" + this.bubbles;
			description += ", cancelable:" + this.cancelable;
			description += ", eventPhase:" + this.eventPhase;
			description += "}";
			
			return description;
		}
	}
}