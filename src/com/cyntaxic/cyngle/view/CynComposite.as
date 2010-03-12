package com.cyntaxic.cyngle.view
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.model.enums.Messages;
	import com.cyntaxic.cyngle.view.interfaces.ICynView;
	import com.cyntaxic.cynccess.cynternal;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	use namespace cynternal;

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
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				if(child === cynModel.views[i]) cynModel.views.splice(i, 1);
			}
			
			removeChild(child as DisplayObject);
			return child;
		}
		
		public function removeAt(index:int):CynView
		{
			var child:DisplayObject = getChildAt(index); 
			
			cynModel.views = cynModel.views.slice(index, 1);
			
			removeChildAt(index);
			return child as CynView;
		}
	}
}