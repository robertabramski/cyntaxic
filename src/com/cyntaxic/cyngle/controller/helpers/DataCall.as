package com.cyntaxic.cyngle.controller.helpers
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.controller.vos.DataCallVO;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.utils.Timer;
	
	public class DataCall extends EventDispatcher
	{
		public static const GET:String = "get";
		public static const POST:String = "post";
		
		private var _timeout:Number = 5;
		
		private var loader:URLLoader;
		private var request:URLRequest;
		private var timer:Timer = new Timer(timeout * 1000);
		
		public function DataCall(url:String, method:String = "get", data:Object = null, contentType:String = "text/plain")
		{
			request = new URLRequest(url);
			loader = new URLLoader();
			
			request.contentType = contentType;
			if(data) request.data = data;
			request.method = URLRequestMethod[method.toUpperCase()];
			
			loader.load(request);
			loader.addEventListener(Event.COMPLETE, handleComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, handleIOError);
			
			timer.addEventListener(TimerEvent.TIMER, handleTimeoutError);
			timer.start();
		}
		
		private function handleTimeoutError(event:TimerEvent):void
		{
			var vo:DataCallVO = new DataCallVO();
			vo.data = "Call timed out after " + timeout + " seconds.";
			
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE, handleTimeoutError);
			
			loader.removeEventListener(Event.COMPLETE, handleComplete);
			dispatchEvent(new DataCallEvent(DataCallEvent.TIMEOUT, vo));
		}
		
		private function handleComplete(event:Event):void
		{
			var vo:DataCallVO = new DataCallVO();
			vo.data = event.target.data as String;
			
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE, handleTimeoutError);
			
			loader.removeEventListener(Event.COMPLETE, handleComplete);
			dispatchEvent(new DataCallEvent(DataCallEvent.COMPLETE, vo));
		}
		
		private function handleIOError(event:IOErrorEvent):void
		{
			var vo:DataCallVO = new DataCallVO();
			vo.data = event.text;
			
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE, handleTimeoutError);
			
			loader.removeEventListener(Event.COMPLETE, handleComplete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, handleIOError);
			dispatchEvent(new DataCallEvent(DataCallEvent.IO_ERROR, vo));
		}
		
		public function get timeout():Number 
		{
			return _timeout;
		}

		public function set timeout(value:Number):void 
		{
			_timeout = value;
			timer = new Timer(_timeout * 1000);
		}
	}
}


