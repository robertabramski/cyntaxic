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
			if(!props.useCapture) props.useCapture = false; 
			if(!props.priority) props.priority = 0; 
			if(!props.useWeakReference) props.priority = false; 
			
			addEventListener(type, listener, props.useCapture, props.priority, props.useWeakReference);
		}
		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function clearListeners():void
		{
			if(this.hasEventListener(CyntaxicEvent.NOTIFY))
				this.removeEventListener(CyntaxicEvent.NOTIFY, update);
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