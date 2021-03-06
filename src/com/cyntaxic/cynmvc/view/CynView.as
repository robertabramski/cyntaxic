package com.cyntaxic.cynmvc.view
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cynmvc.Cyntaxic;
	import com.cyntaxic.cynmvc.CyntaxicEvent;
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.controller.CynController;
	import com.cyntaxic.cynmvc.controller.enums.ErrorCodes;
	import com.cyntaxic.cynmvc.controller.vos.ResizeVO;
	import com.cyntaxic.cynmvc.model.CynModel;
	import com.cyntaxic.cynmvc.view.interfaces.ICynView;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * <code>CynView</code> is the abstract base class for <code>CynComposite</code> and <code>CynComponent</code>.
	 * It should be an extended by either a <code>CynComposite</code> or a <code>CynComponent</code> class. 
	 * If there is an attempt to extend <code>CynView</code> with any other class a <code>CynError</code> is thrown.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class CynView extends Sprite implements ICynView
	{
		use namespace cynternal;
		
		/**
		 * @private
		 * 
		 */
		cynternal var controller:CynController;
		
		/**
		 * A reference to the <code>CynModel</code>.
		 */
		protected var cynModel:CynModel;
		
		/**
		 * A reference to the <code>CynController</code>.
		 */ 	
		protected var cynController:CynController;
		
		/**
		 * Flag to set whether debugging is suppressed for this <code>CynView</code>.
		 */
		protected var suppressDebug:Boolean = false;
		
		/**
		 * List of properties to describe on the view when using <code>describe</code>.
		 * 
		 * @see #describe()
		 * 
		 */		
		protected var describeProperties:Array = ['x', 'y', 'z', 'width', 'height', 'rotation', 'name'];
		
		private var listeners:Array = [];
		
		/**
		 * Creates a new instance of <code>CynView</code>.
		 * 
		 * @param self Reference to itself to enforce it as an abstract class.
		 * 
		 * @throws CynError If attempted to be extended without <code>super(this)</code> or by a class that is not <code>CynComposite</code> or <code>CynComponent</code>.
		 * 
		 */
		public function CynView(self:CynView)
		{
			if(self != this) Cyntaxic.throwError(ErrorCodes.E_1003);
			
			if(self is CynComposite || self is CynComponent || self is CynViewProxy)
			{
				cynModel = Cyntaxic.MODEL;
				cynController = Cyntaxic.CONTROLLER;
				
				controller = cynController;
				cynModel.views.push(this);
			}
			else Cyntaxic.throwError(ErrorCodes.E_1004);
		}
		
		/**
		 * Optionally initialize a view. This is useful when extending a graphical
		 * objects from a Flash library where the constructor is not available.
		 *  
		 * @param vo The value object to pass parameters.
		 * @return The <code>CynView</code> for chainability.
		 * 
		 */
		public function init(vo:CyntaxicVO):CynView
		{
			return this;
		}
		
		/**
		 * Traces out a debugging message.
		 *  
		 * @param message The message to be traced out.
		 * 
		 */
		protected function debug(message:Object):void
		{
			if(!suppressDebug) Cyntaxic.DEBUGGER.log(this, message);
		}
		
		/**
		 * @private Calls function handle on view.
		 * 
		 */
		cynternal function update(event:CyntaxicEvent):void
		{
			var view:DisplayObject;
			
			if(event.view is CynViewProxy) view = (event.view as CynViewProxy).actualView;
			else view = event.view as CynView;
			
			if(view.hasOwnProperty(event.handle) && view[event.handle] is Function)
			{
				view[event.handle](event.vo);
			}
		}
		
		/**
		 * Shorthand method for <code>addEventListener</code>. The first arguments are the 
		 * same, but the last few are passed in with an object. Named the same as <code>addEventListener</code>.
		 *  
		 * @param type The type of the event listener.
		 * @param listener The listener function.
		 * @param props An object containing any or all of the properties <code>useCapture</code>, <code>priority</code>, and <code>useWeakReference</code>.
		 * 
		 */
		public function addListener(type:String, listener:Function, props:Object = null):void
		{
			if(!props) props = new Object();
			
			if(!props.useCapture) props.useCapture = false; 
			if(!props.priority) props.priority = 0; 
			if(!props.useWeakReference) props.useWeakReference = false;
			
			addEventListener(type, listener, props.useCapture, props.priority, props.useWeakReference);
		}
		
		/**
		 * Shorthand method for <code>addEventListener</code> using weak reference. The parameters 
		 * <code>useCapture</code> and <code>priority</code> are set to the default for <code>addEventListener</code>. 
		 * To change these use <code>addListener</code>.
		 *  
		 * @param type The type of the event listener.
		 * @param listener The listener function.
		 * 
		 * @see #addListener()
		 * 
		 */
		public function addWeakListener(type:String, listener:Function):void
		{
			addEventListener(type, listener, false, 0, true);
		}
		
		/**
		 * Shorthand method for <code>removeEventListener</code>. This function differs 
		 * as the function name does not need to be passed in. It looks for the first 
		 * event that matches the type and removes it. If there is more than
		 * one by the same name, it only removes the first one. 
		 *  
		 * @param type The type of the event listener.
		 * 
		 */
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
		
		/**
		 * Removes all children of the <code>DisplayObject</code> from the display list.
		 * On completion an array of the objects removed is returned.
		 *  
		 * @return An array of the objects removed.
		 * 
		 */
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
		
		/**
		 * @private Already in Adobe documentation.
		 * 
		 */
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
		
		/**
		 * @private Already in Adobe documentation.
		 * 
		 */		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
			listeners.push(new ListenerVO(type, listener, useCapture, priority, useWeakReference));
		}
		
		/**
		 * Removes all the listeners added. 
		 * 
		 */
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
		
		/**
		 * Returns a copy of the listeners on the <code>CynView</code>.
		 *  
		 * @return An array of the listeners on the <code>CynView</code>.
		 * 
		 */
		public function getListeners():Array
		{
			return listeners.slice();
		}
		
		/**
		 * Returns a valid JSON string describing the listeners.
		 *  
		 * @param compact If false the string is not compacted.
		 * @return A valid JSON string.
		 * 
		 */
		public function describeListeners(compact:Boolean = true):String
		{
			return Cyntaxic.describe(listeners, compact);
		}
		
		/**
		 * Returns a valid JSON string describing some commonly used display properties. 
		 * To change the properties being described add or remove from <code>describeProperties</code>.
		 * 
		 * @param compact If false the string is not compacted.
		 * @return A valid JSON string.
		 * 
		 * @see describeProperties 
		 * 
		 */
		public function describe(compact:Boolean = true):String
		{
			var describeObject:CyntaxicVO = new CyntaxicVO();
			
			for(var i:int = 0; i < describeProperties.length; i++)
			{
				describeObject[describeProperties[i]] = this[describeProperties[i]];
			}
			
			return Cyntaxic.describe(describeObject, compact);
		}
		
		/**
		 * Invoked when <code>Event.RESIZE</code> event is fired. A <code>ResizeVO</code> is passed 
		 * in containing <code>stage.stageWidth</code> and <code>stage.stageHeight</code> properties.
		 *  
		 * @param vo A <code>ResizeVO</code> containing <code>stage.stageWidth</code> and <code>stage.stageHeight</code> properties.
		 * 
		 */
		public function resize(vo:ResizeVO):void
		{
			
		}
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
	
	
	