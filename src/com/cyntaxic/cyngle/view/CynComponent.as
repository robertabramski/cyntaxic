package com.cyntaxic.cyngle.view
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.CyntaxicVO;
	import com.cyntaxic.cyngle.model.enums.Messages;
	import com.cyntaxic.cyngle.view.interfaces.ICynView;
	import com.cyntaxic.cynccess.cynternal;
	
	import flash.events.Event;
	
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