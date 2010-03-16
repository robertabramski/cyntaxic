package com.cyntaxic.cyngle.controller
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.CyntaxicVO;
	import com.cyntaxic.cyngle.controller.vos.ErrorCodeVO;
	import com.cyntaxic.cyngle.model.CynModel;
	import com.cyntaxic.cyngle.model.enums.Messages;
	import com.cyntaxic.cyngle.view.CynView;
	import com.cyntaxic.cynccess.cynternal;
	
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
			Cyntaxic.DEBUGGER.log(this, Messages.INIT);
			cynModel = Cyntaxic.MODEL;
			
			return this;
		}
		
		public function execute(handle:String, vo:CyntaxicVO, suppressDebug:Boolean = false):void
		{
			this[handle](vo);
			
			if(!suppressDebug)
			{
				var data:Object = (vo ? (Cyntaxic.deepDescribe ? vo.describe() : vo) : "");
				Cyntaxic.DEBUGGER.log(this, "Executed function: " + handle + "(" + data + ");");
			}
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


