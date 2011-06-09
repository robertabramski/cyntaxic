package com.cyntaxic.cynmvc.view
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cynmvc.Cyntaxic;
	import com.cyntaxic.cynmvc.model.CynModel;
	import com.cyntaxic.cynmvc.view.interfaces.ICynView;
	
	import flash.display.DisplayObject;
	
	public dynamic class CynViewProxy extends CynView implements ICynView
	{
		use namespace cynternal;
		
		private var _actualView:DisplayObject;
		
		/**
		 * @private Constructor is private. 
		 * 
		 */
		public function CynViewProxy(key:Key, view:DisplayObject)
		{
			super(this);
			
			_actualView = view;
			
			cynModel = Cyntaxic.MODEL;
			cynController = controller = Cyntaxic.CONTROLLER;
		}
		
		public static function add(view:DisplayObject):void
		{
			var cynModel:CynModel = Cyntaxic.MODEL as CynModel;
			
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				if(view == cynModel.views[i].actualView) return;
			}
			
			new CynViewProxy(new Key(), view);
		}
		
		public static function remove(view:DisplayObject):void
		{
			var cynModel:CynModel = Cyntaxic.MODEL as CynModel;
			
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				if(view == cynModel.views[i].actualView)
				{
					cynModel.views.splice(i, 1);
				}
			}
		}
		
		/**
		 * @private Used in update function. 
		 * 
		 */		
		cynternal function get actualView():DisplayObject
		{
			return _actualView;
		}
	}
}

internal class Key { }


