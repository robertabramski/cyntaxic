package com.cyntaxic.cyngle.view
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.CyntaxicEvent;
	import com.cyntaxic.cyngle.CyntaxicVO;
	import com.cyntaxic.cyngle.controller.CynController;
	import com.cyntaxic.cyngle.model.CynModel;
	import com.cyntaxic.cyngle.view.interfaces.ICynView;
	
	import flash.display.Sprite;
	
	public class CynView extends Sprite implements ICynView
	{
		use namespace cynternal;
		
		protected var cynModel:CynModel;
		protected var cynController:CynController;
		protected var suppressDebug:Boolean = false;
		
		private var listeners:Array = [];
		
		public function CynView()
		{
			cynModel = Cyntaxic.MODEL;
			cynController = Cyntaxic.CONTROLLER;
			
			cynController.addEventListener(CyntaxicEvent.NOTIFY, update);
			cynModel.views.push(this);
		}
		
		public function init(vo:CyntaxicVO):CynView
		{
			return this;
		}
		
		protected function debug(message:Object):void
		{
			if(!suppressDebug) Cyntaxic.DEBUGGER.log(this, message);
		}
		
		public function update(event:CyntaxicEvent):void
		{
			if(this.hasOwnProperty(event.handle))
			{
				this[event.handle](event.vo);
			}
		}
		
		public function listen(type:String, listener:Function, props:Object = null):void
		{
			if(!props) props = new Object();
			
			if(!props.useCapture) props.useCapture = false; 
			if(!props.priority) props.priority = 0; 
			if(!props.useWeakReference) props.priority = false;
			
			addEventListener(type, listener, props.useCapture, props.priority, props.useWeakReference);
		}
		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
			listeners.push({type:type, listener:listener, useCapture:useCapture, priority:priority, useWeakReference:useWeakReference});
		}
		
		public function clearListeners():void
		{
			for(var i:int = 0; i < listeners.length; i++)
			{
				if(this.hasEventListener(listeners[i].type)) 
					this.removeEventListener(listeners[i].type, listeners[i].listener);
			}
		}
		
		public function getListeners():Array
		{
			return listeners.slice();
		}
		
		public function describeListeners(compact:Boolean = true):String
		{
			return Cyntaxic.describe(listeners, compact);
		}
		
		public function describe(compact:Boolean = true):String
		{
			return Cyntaxic.describe(this, compact);
		}
		
		public function resize():void
		{
					
		}
	}
}