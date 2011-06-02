package com.cyntaxic.cyngle.view
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.CyntaxicEvent;
	import com.cyntaxic.cyngle.controller.enums.ErrorCodes;
	import com.cyntaxic.cyngle.model.CynModel;
	import com.cyntaxic.cyngle.view.interfaces.ICynView;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.system.System;
	
	public class CynComposite extends CynView implements ICynView
	{
		use namespace cynternal;
		
		public function CynComposite()
		{
			
		}
		
		public function add(view:CynView, props:Object = null):CynView
		{
			addChild(view as DisplayObject);
			addProps(view, props);
			
			return view;
		}
		
		public function addAt(view:CynView, index:int, props:Object = null):CynView
		{
			addChildAt(view as DisplayObject, index);
			addProps(view, props);
			
			return view;
		}
		
		private function addProps(view:CynView, props:Object):void
		{
			for(var prop:String in props)
			{
				view[prop] = props[prop];
			}
		}
		
		private function removeCompletely(view:CynView):void
		{
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				if(view == cynModel.views[i])
				{
					cynModel.views.splice(i, 1);
					clearListeners();
					
					for(var j:int = 0; j < view.numChildren; j++)
					{
						var childView:* = view.getChildAt(j);
						
						if(childView is CynView)
						{ 
							removeCompletely(childView as CynView);
						}
					}
				}
			}
		}
		
		public function remove(view:CynView, completely:Boolean = false):CynView
		{
			if(completely)
			{
				removeCompletely(view);
				removeChild(view as DisplayObject);
				view = null; System.gc();
			}
			else removeChild(view as DisplayObject);
			
			return view;
		}
		
		public function removeAt(index:int, completely:Boolean = false):CynView
		{
			if(getChildAt(index) is CynView) return remove(getChildAt(index) as CynView, completely);
			else throw new Error(ErrorCodes.E_5001);
		}
	}
}