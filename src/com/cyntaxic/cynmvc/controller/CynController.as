package com.cyntaxic.cynmvc.controller
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cynmvc.Cyntaxic;
	import com.cyntaxic.cynmvc.CyntaxicEvent;
	import com.cyntaxic.cynmvc.CyntaxicHandles;
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.controller.enums.ErrorCodes;
	import com.cyntaxic.cynmvc.controller.errors.CynError;
	import com.cyntaxic.cynmvc.controller.vos.ErrorCodeVO;
	import com.cyntaxic.cynmvc.model.CynModel;
	
	import flash.events.EventDispatcher;
	
	public class CynController extends EventDispatcher
	{
		use namespace cynternal;
		
		protected var cynModel:CynModel;
		
		public function CynController(self:CynController)
		{
			if(self != this) throwError(ErrorCodes.E_1003);
		}
		
		cynternal function init():CynController
		{
			cynModel = Cyntaxic.MODEL;
			return this;
		}
		
		public function execute(handle:String, vo:CyntaxicVO):void
		{
			this[handle](vo);
		}
		
		protected function notify(handle:String, vo:CyntaxicVO):void
		{
			dispatchEvent(new CyntaxicEvent(handle, vo));
		}
		
		protected function debug(message:Object):void
		{
			Cyntaxic.DEBUGGER.log(this, message);
		}
		
		cynternal function throwError(vo:CyntaxicVO):void
		{
			throw new CynError((vo as ErrorCodeVO).message, (vo as ErrorCodeVO).id);
		}
		
		cynternal function resizeViews(vo:CyntaxicVO):void
		{
			notify(CyntaxicHandles.RESIZE, vo);
		}
		
		cynternal function listen(type:String, listener:Function, props:Object = null):void
		{
			if(!props) props = new Object();
			
			if(!props.useCapture) props.useCapture = false; 
			if(!props.priority) props.priority = 0; 
			if(!props.useWeakReference) props.priority = false;
			
			super.addEventListener(type, listener, props.useCapture, props.priority, props.useWeakReference);
		}
		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			throwError(ErrorCodes.E_1002);
		}
		
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			throwError(ErrorCodes.E_1002);
		}
		
		override public function hasEventListener(type:String):Boolean
		{
			throwError(ErrorCodes.E_1002);
			return false;
		}
	}
}


