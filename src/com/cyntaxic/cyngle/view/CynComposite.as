package com.cyntaxic.cyngle.view
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.CyntaxicEvent;
	import com.cyntaxic.cyngle.model.CynModel;
	import com.cyntaxic.cyngle.view.interfaces.ICynView;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	use namespace cynternal;

	public class CynComposite extends CynView implements ICynView
	{
		public function CynComposite()
		{
			
		}
		
		public function add(child:CynView, props:Object = null):CynView
		{
			addChild(child as DisplayObject);
			
			for(var prop:String in props)
			{
				child[prop] = props[prop];
			}
			
			return child;
		}
		
		public function addAt(child:CynView, index:int, props:Object = null):CynView
		{
			addChildAt(child as DisplayObject, index);
			
			for(var prop:String in props)
			{
				child[prop] = props[prop];
			}
			
			return child;
		}
		
		private function removeChildren(composite:CynComposite):void
		{
			if(composite.hasEventListener(CyntaxicEvent.NOTIFY)) 
				composite.removeEventListener(CyntaxicEvent.NOTIFY, update);
			
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				var view:CynView = cynModel.views[i] as CynView;
				
				if(composite.contains(view))
				{
					cynModel.views.splice(i, 1);
					trace('recursive ' + cynModel.views);
					
					if(view is CynComposite) removeChildren(view as CynComposite);
				}
			}
		}
		
		public function remove(child:CynView):CynView
		{
			var view:CynView = child;
			
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				if(view == cynModel.views[i])
				{
					cynModel.views.splice(i, 1); 
					trace(cynModel.views);
					
					if(view is CynComposite) removeChildren(view as CynComposite);
				}
			}
			
			removeChild(child as DisplayObject);
			return child;
		}
		
		public function removeAt(index:int):CynView
		{
			var child:DisplayObject = getChildAt(index); 
			
			cynModel.views.splice(index, 1);
			trace(cynModel.views);
			
			removeChildAt(index);
			return child as CynView;
		}
	}
}