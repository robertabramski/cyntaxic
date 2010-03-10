package com.cytaxic.cyngle.controller
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.controller.vos.ErrorCodeVO;
	import com.cytaxic.cyngle.model.CynModel;
	import com.cytaxic.cyngle.model.enums.Messages;
	import com.cytaxic.cyngle.view.CynView;
	
	import flash.events.EventDispatcher;
	
	public class CynController extends EventDispatcher
	{
		protected var cynModel:CynModel;
		
		public function CynController()
		{
			
		}
		
		public function init():CynController
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
		
		protected function throwError(vo:CyntaxicVO):void
		{
			throw new Error((vo as ErrorCodeVO).message, (vo as ErrorCodeVO).id);
		}
		
		protected function redrawViews(vo:CyntaxicVO):void
		{
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				(cynModel.views[i] as CynView).resize();
			}
		}
	}
}


