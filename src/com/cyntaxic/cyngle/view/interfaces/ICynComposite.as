package com.cyntaxic.cyngle.view.interfaces
{
	import com.cyntaxic.cyngle.view.CynView;
	
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