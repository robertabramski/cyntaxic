package com.cytaxic.cyngle.view
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.model.enums.Messages;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
	import flash.display.DisplayObject;
	import flash.events.Event;

	public class CynComposite extends CynView implements ICynView
	{
		public function CynComposite()
		{
			addEventListener(Event.ADDED_TO_STAGE, addToStage);
		}
		
		private function addToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addToStage);
			
			if(Cyntaxic.DEEP_DEBUG)	
				Cyntaxic.DEBUGGER.log(this, Messages.ADDED_TO_STAGE);
		}
		
		public function add(child:CynView):CynView
		{
			addChild(child as DisplayObject);
			return child;
		}
		
		public function addAt(child:CynView, index:int):CynView
		{
			addChildAt(child as DisplayObject, index);
			return child;
		}
		
		public function remove(child:CynView):CynView
		{
			removeChild(child as DisplayObject);
			return child;
		}
		
		public function removeAt(index:int):CynView
		{
			var child:DisplayObject = getChildAt(index); 
			
			removeChildAt(index);
			return child as CynView;
		}
	}
}