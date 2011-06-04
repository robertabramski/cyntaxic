package com.cyntaxic.cynmvc.view
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cynmvc.Cyntaxic;
	import com.cyntaxic.cynmvc.CyntaxicEvent;
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.controller.CynController;
	import com.cyntaxic.cynmvc.model.CynModel;
	import com.cyntaxic.cynmvc.view.interfaces.ICynView;
	
	import flash.display.DisplayObject;
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
			
			cynController.listen(CyntaxicEvent.NOTIFY, update);
			cynModel.views.push(this);
			
			listeners.push(new ListenerVO(CyntaxicEvent.NOTIFY, update, false, 0, false));
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
		
		public function addListener(type:String, listener:Function, props:Object = null):void
		{
			if(!props) props = new Object();
			
			if(!props.useCapture) props.useCapture = false; 
			if(!props.priority) props.priority = 0; 
			if(!props.useWeakReference) props.priority = false;
			
			addEventListener(type, listener, props.useCapture, props.priority, props.useWeakReference);
		}
		
		public function removeListener(type:String):void
		{
			for(var i:int = 0; i < listeners.length; i++)
			{
				var vo:ListenerVO = listeners[i] as ListenerVO;
				
				if(vo.type == type)
				{
					removeEventListener(vo.type, vo.listener);
					return;
				}
			}
		}
		
		public function removeAllChildren():Array
		{
			var children:Array = [];
			
			while(this.numChildren > 0) 
			{
				var child:DisplayObject = this.removeChildAt(0);
				children.push(child);
			}
			
			return children;
		}
		
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			super.removeEventListener(type, listener, useCapture);
			
			for(var i:int = 0; i < listeners.length; i++)
			{
				var vo:ListenerVO = listeners[i] as ListenerVO;
				
				if(vo.type == type && vo.listener == listener)
				{
					listeners.splice(i, 1);
				}
			}
		}
		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
			listeners.push(new ListenerVO(type, listener, useCapture, priority, useWeakReference));
		}
		
		public function removeAllListeners():void
		{
			for(var i:int = 0; i < listeners.length; i++)
			{
				var vo:ListenerVO = listeners[i] as ListenerVO;
				
				if(this.hasEventListener(vo.type))
					this.removeEventListener(vo.type, vo.listener);
			}
			
			listeners = [];
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
		
		public function resize(vo:CyntaxicVO):void
		{
				
		}
		
		override public function get x():Number { return super.x; }
		override public function set x(value:Number):void { super.x = value; }
		
		override public function get y():Number { return super.y; }
		override public function set y(value:Number):void { super.y = value; }
		
		override public function get z():Number { return super.z; }
		override public function set z(value:Number):void { super.z = value; }
		
		override public function get width():Number { return super.width; }
		override public function set width(value:Number):void { super.width = value; }
		
		override public function get height():Number { return super.height; }
		override public function set height(value:Number):void { super.height = value; }
		
		override public function get rotation():Number { return super.rotation; }
		override public function set rotation(value:Number):void { super.rotation = value; }
		
		override public function get name():String { return super.name; }
		override public function set name(value:String):void { super.name = value; }
	}
}

internal class ListenerVO extends com.cyntaxic.cynmvc.CyntaxicVO
{
	private var _type:String;
	private var _listener:Function;
	private var _useCapture:Boolean;
	private var _priority:int;
	private var _useWeakReference:Boolean;
	
	public function ListenerVO(type:String, listener:Function, useCapture:Boolean, priority:int, useWeakReference:Boolean)
	{
		_type = type;
		_listener = listener;
		_useCapture = useCapture;
		_priority = priority;
		_useWeakReference = useWeakReference;
	}
	
	public function get type():String { return _type; }
	public function set type(value:String):void { _type = value; }
	
	public function get listener():Function { return _listener; }
	public function set listener(value:Function):void { _listener = value; }
	
	public function get useCapture():Boolean { return _useCapture; }
	public function set useCapture(value:Boolean):void { _useCapture = value; }
	
	public function get priority():int { return _priority; }
	public function set priority(value:int):void { _priority = value; }
	
	public function get useWeakReference():Boolean { return _useWeakReference; }
	public function set useWeakReference(value:Boolean):void { _useWeakReference = value; }
}	
	
	
	