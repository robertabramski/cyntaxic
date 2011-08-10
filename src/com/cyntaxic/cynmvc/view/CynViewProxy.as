package com.cyntaxic.cynmvc.view
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cynmvc.Cyntaxic;
	import com.cyntaxic.cynmvc.model.CynModel;
	import com.cyntaxic.cynmvc.view.interfaces.ICynView;
	
	import flash.display.DisplayObject;
	
	/**
	 * <code>CynViewProxy</code> is a decorator for setting up views that cannot 
	 * directly extend <code>CynComponent</code> or the <code>CynComposite</code> classes. 
	 * Using the <code>add</code> and <code>remove</code> functions allow views to listen 
	 * and to unlisten for notifications from the controller. Instances of <code>CynViewProxy</code> 
	 * are not directly accessible as the constructor is private and the static functions do not 
	 * return a value.
	 * 
	 * @author robertabramski
	 * 
	 */	
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
		
		/**
		 * Adds a view to the framework that cannot extend <code>CynComponent</code>
		 * or <code>CynComposite</code>. This allows the view to be notified by the contoller. 
		 *  
		 * @param view The proxy view to be added.
		 * 
		 */
		public static function add(view:DisplayObject):void
		{
			var cynModel:CynModel = Cyntaxic.MODEL as CynModel;
			
			for(var i:int = 0; i < cynModel.views.length; i++)
			{
				if(view == cynModel.views[i].actualView) return;
			}
			
			new CynViewProxy(new Key(), view);
		}
		
		/**
		 * Removes a proxy view from notifications from the controller.
		 * 
		 * @param view The proxy view to be removed.
		 * 
		 */	
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
		 * Returns the view proxy.
		 * 
		 * @return The view passed in the <code>add</code> function. 
		 * 
		 */		
		public function get actualView():DisplayObject
		{
			return _actualView;
		}
	}
}

internal class Key { }


