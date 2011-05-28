package com.cyntaxic.cyngle.view
{
	import com.cyntaxic.cynccess.cynternal;
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
		
		public function remove(child:CynView):CynView
		{
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				if(child === cynModel.views[i]) { cynModel.views.splice(i, 1); trace(cynModel.views); }
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