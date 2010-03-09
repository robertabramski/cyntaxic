package com.cytaxic.cyngle.view.interfaces
{
	import com.cytaxic.cyngle.view.CynView;
	
	public interface ICynComposite
	{
		function add(child:CynView):CynView
		function addAt(child:CynView, index:int):CynView
		function remove(child:CynView):CynView
		function removeAt(index:int):CynView
	}
}