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
		/**
		 * Optionally initialize a view. This is useful when extending a graphical
		 * objects from a Flash library where the constructor is not available.
		 *  
		 * @param vo The value object to pass parameters.
		 * @return The <code>CynView</code> for chainability.
		 * 
		 */
		function init(vo:CyntaxicVO):CynView
			
		/**
		 * Invoked when Event.RESIZE event is fired. A <code>ResizeVO</code> is passed 
		 * in containing <code>stage.stageWidth</code> and <code>stage.stageHeight</code> properties.
		 *  
		 * @param vo A <code>ResizeVO</code> containing <code>stage.stageWidth</code> and <code>stage.stageHeight</code> properties.
		 * 
		 */
		function resize(vo:ResizeVO):void
	}
}