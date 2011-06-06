package com.cyntaxic.cynmvc.view.interfaces
{
	import com.cyntaxic.cynmvc.CyntaxicEvent;
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.controller.vos.ResizeVO;
	import com.cyntaxic.cynmvc.view.CynView;
	
	/**
	 * This interface is used to define a <code>CynView</code> object.
	 *  
	 * @author robertabramski
	 * 
	 */
	public interface ICynView
	{
		function init(vo:CyntaxicVO):CynView
		function resize(vo:ResizeVO):void
	}
}