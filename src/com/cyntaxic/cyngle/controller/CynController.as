package com.cyntaxic.cyngle.controller
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.CyntaxicEvent;
	import com.cyntaxic.cyngle.CyntaxicVO;
	import com.cyntaxic.cyngle.controller.vos.ErrorCodeVO;
	import com.cyntaxic.cyngle.model.CynModel;
	import com.cyntaxic.cyngle.view.CynView;
	
	import flash.events.EventDispatcher;
	
	public class CynController extends EventDispatcher
	{
		use namespace cynternal;
		
		protected var cynModel:CynModel;
		
		public function CynController()
		{
			
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
			throw new Error((vo as ErrorCodeVO).message, (vo as ErrorCodeVO).id);
		}
		
		cynternal function resizeViews(vo:CyntaxicVO):void
		{
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				(cynModel.views[i] as CynView).resize();
			}
		}
	}
}


