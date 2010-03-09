package com.cytaxic.cyngle.view.interfaces
{
	public interface ICynComposite
	{
		function add(child:ICynView):ICynView
		function addAt(child:ICynView, index:int):ICynView
		function remove(child:ICynView):ICynView
		function removeAt(index:int):ICynView
	}
}