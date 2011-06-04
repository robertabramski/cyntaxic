package com.cyntaxic.cynmvc.view.interfaces
{
	import com.cyntaxic.cynmvc.CyntaxicEvent;
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.view.CynView;
	
	public interface ICynView
	{
		function init(vo:CyntaxicVO):CynView
		function update(event:CyntaxicEvent):void
		function resize(vo:CyntaxicVO):void
	}
}