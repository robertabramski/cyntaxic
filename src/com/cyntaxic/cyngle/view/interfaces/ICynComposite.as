package com.cyntaxic.cyngle.view.interfaces
{
	import com.cyntaxic.cyngle.view.CynView;
	
	public interface ICynComposite
	{
		function add(child:CynView, props:Object = null):CynView
		function addAt(child:CynView, index:int, props:Object = null):CynView
		function remove(child:CynView):CynView
		function removeAt(index:int):CynView
	}
}