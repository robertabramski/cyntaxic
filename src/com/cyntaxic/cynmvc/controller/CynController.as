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
	import com.cyntaxic.cynmvc.view.CynView;
	
	import flash.events.EventDispatcher;
	
	/**
	 * <code>CynController</code> is an abstract class to be extended by the application being 
	 * created with the Cyntaxic framework. The controller is where all the processing logic 
	 * is handled in the application.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class CynController extends EventDispatcher
	{
		use namespace cynternal;
		
		/**
		 * Reference to the instance of <code>CynModel</code>. 
		 */		
		protected var cynModel:CynModel;
		
		/**
		 * Creates a new instance of <code>CynController</code>.
		 * 
		 * @param self Reference to itself to enforce it as an abstract class.
		 * 
		 * @throws CynError If attempted to be extended without super(this).
		 * 
		 */
		public function CynController(self:CynController)
		{
			if(self != this) throwError(ErrorCodes.E_1003);
		}
		
		cynternal function init():CynController
		{
			cynModel = Cyntaxic.MODEL;
			return this;
		}
		
		/**
		 * Executes a controller function.
		 *  
		 * @param handle The function handle to be executed.
		 * @param vo The value object being passed.
		 * 
		 */		
		public function execute(handle:String, vo:CyntaxicVO):void
		{
			this[handle](vo);
		}
		
		/**
		 * Notifies <code>CynView</code> classes to update the view.
		 *  
		 * @param handle The function handle to be notified about.
		 * @param vo The value object being passed.
		 * 
		 */		
		protected function notify(handle:String, vo:CyntaxicVO):void
		{
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				var cynView:CynView = cynModel.views[i] as CynView;
				
				if(cynView.hasOwnProperty(handle))
				{
					cynView.controller.listen(CyntaxicEvent.NOTIFY, cynView.update);
					dispatchEvent(new CyntaxicEvent(handle, vo));
					
					cynView.controller.unlisten(CyntaxicEvent.NOTIFY, cynView.update);
				}
			}
		}
		
		/**
		 * Traces out a debugging message.
		 *  
		 * @param message The message to be traced out.
		 * 
		 */		
		protected function debug(message:Object):void
		{
			Cyntaxic.DEBUGGER.log(this, message);
		}
			
		cynternal function throwError(vo:ErrorCodeVO):void
		{
			throw new CynError(vo.message, vo.id);
		}
		
		cynternal function resizeViews(vo:CyntaxicVO):void
		{
			notify(CyntaxicHandles.RESIZE, vo);
		}
		
		cynternal function listen(type:String, listener:Function):void
		{
			super.addEventListener(type, listener);
		}
		
		cynternal function unlisten(type:String, listener:Function):void
		{
			super.removeEventListener(type, listener);
		}
		
		/**
		 * @private Operation is illegal on the controller.
		 */		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			throwError(ErrorCodes.E_1002);
		}
		
		/**
		 * @private Operation is illegal on the controller. 
		 */
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			throwError(ErrorCodes.E_1002);
		}
		
		/**
		 * @private Operation is illegal on the controller.
		 */
		override public function hasEventListener(type:String):Boolean
		{
			throwError(ErrorCodes.E_1002);
			return false;
		}
	}
}


