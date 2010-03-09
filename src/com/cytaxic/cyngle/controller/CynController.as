package com.cytaxic.cyngle.controller
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.controller.vos.ErrorCodeVO;
	import com.cytaxic.cyngle.model.enums.Messages;
	
	import flash.events.EventDispatcher;
	
	public class CynController extends EventDispatcher
	{
		protected var model:*;
		
		public function CynController()
		{
			
		}
		
		public function init():CynController
		{
			Cyntaxic.DEBUGGER.log(this, Messages.INIT);
			model = Cyntaxic.MODEL;
			return this;
		}
		
		public function execute(handle:String, vo:CyntaxicVO):void
		{
			this[handle](vo);
			
			if(Cyntaxic.DEEP_DEBUG)
				Cyntaxic.DEBUGGER.log(this, "Executed function: " + handle + "(" + (vo ? vo.describe() : "") + ");");
		}
		
		protected function throwError(vo:CyntaxicVO):void
		{
			throw new Error((vo as ErrorCodeVO).message, (vo as ErrorCodeVO).id);
		}
	}
}


