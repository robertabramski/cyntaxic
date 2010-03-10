package com.cytaxic.cyngle.view
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.model.enums.Messages;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	import com.cytaxic.cynccess.cyntaxic;
	
	import flash.events.Event;
	
	//use namespace cyntaxic;
	
	public class CynComponent extends CynView implements ICynView
	{
		public function CynComponent()
		{
			addEventListener(Event.ADDED_TO_STAGE, addToStage);
		}
		
		private function addToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addToStage);
			
			if(Cyntaxic.DEEP_DEBUG)	
				Cyntaxic.DEBUGGER.log(this, Messages.ADDED_TO_STAGE);
		}
	}
}