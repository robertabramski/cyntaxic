package com.cytaxic.cyngle.controller
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.controller.vos.ErrorCodeVO;
	import com.cytaxic.cyngle.model.CynModel;
	import com.cytaxic.cyngle.model.enums.Messages;
	import com.cytaxic.cyngle.view.CynView;
	import com.cytaxic.cynccess.cynternal;
	
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
				if(Cyntaxic.DEEP_DEBUG)
					Cyntaxic.DEBUGGER.log(this, "Executed function: " + handle + "(" + (vo ? vo.describe() : "") + ");");
			}
		}
		
		cynternal function throwError(vo:CyntaxicVO):void
		{
			throw new Error((vo as ErrorCodeVO).message, (vo as ErrorCodeVO).id);
		}
		
		cynternal function redrawViews(vo:CyntaxicVO):void
		{
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				(cynModel.views[i] as CynView).resize();
			}
		}
	}
}


