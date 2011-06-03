package com.cyntaxic.cyngle.view.interfaces
{
	import com.cyntaxic.cyngle.CyntaxicEvent;
	import com.cyntaxic.cyngle.CyntaxicVO;
	import com.cyntaxic.cyngle.view.CynView;
	
	public interface ICynView
	{
		function init(vo:CyntaxicVO):CynView
		function update(event:CyntaxicEvent):void
		function resize(vo:CyntaxicVO):void
	}
}