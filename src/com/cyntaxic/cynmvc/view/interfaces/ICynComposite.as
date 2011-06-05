package com.cyntaxic.cynmvc.view.interfaces
{
	import com.cyntaxic.cynmvc.view.CynView;
	
	/**
	 * This interface is used to define a <code>CynView</code> object that has
	 * children that are views.
	 *  
	 * @author robertabramski
	 * 
	 */
	public interface ICynComposite
	{
		function add(child:CynView, props:Object = null):CynView
		function addAt(child:CynView, index:int, props:Object = null):CynView
		function remove(child:CynView, completely:Boolean = false):CynView
		function removeAt(index:int, completely:Boolean = false):CynView
		function destroy(view:CynView):void
		function destroyAt(index:int):void
	}
}