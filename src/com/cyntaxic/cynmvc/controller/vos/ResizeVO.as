package com.cyntaxic.cynmvc.controller.vos
{
	import com.cyntaxic.cynmvc.Cyntaxic;
	import com.cyntaxic.cynmvc.CyntaxicVO;
	
	/**
	 * The <code>ResizeVO</code> class is a value object used to contain information about 
	 * the stage dimensions.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class ResizeVO extends CyntaxicVO
	{
		private var _stageWidth:int;
		private var _stageHeight:int;
		
		/**
		 * Creates a new <code>ResizeVO</code> object which contains the width and 
		 * the height of the stage.
		 *  
		 */
		public function ResizeVO()
		{
			_stageWidth = Cyntaxic.STAGE.stageWidth;
			_stageHeight = Cyntaxic.STAGE.stageHeight;
		}
		
		/**
		 * The width of the stage. 
		 *  
		 * @return The width of the stage. 
		 * 
		 */		
		public function get stageWidth():int { return _stageWidth; }
		
		
		/**
		 * The height of the stage. 
		 *  
		 * @return The height of the stage. 
		 * 
		 */
		public function get stageHeight():int { return _stageHeight; }
	}
}