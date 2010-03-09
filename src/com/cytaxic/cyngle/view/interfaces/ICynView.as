package com.cytaxic.cyngle.view.interfaces
{
	import com.cytaxic.cyngle.CyntaxicEvent;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.view.CynView;
	
	public interface ICynView
	{
		function init(vo:CyntaxicVO):CynView
		function update(event:CyntaxicEvent):void
		function resize():void
	}
}