package com.cyntaxic.cyngle.view
{
	import com.cyntaxic.cyngle.view.interfaces.ICynView;
	
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
		}
	}
}