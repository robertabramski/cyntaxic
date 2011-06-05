package com.cyntaxic.cynmvc.controller.vos
{
	import com.cyntaxic.cynmvc.CyntaxicVO;
	
	/**
	 * The <code>ErrorCodeVO</code> class is a value object used to contain information about a <code>CynError</code>.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class ErrorCodeVO extends CyntaxicVO
	{
		public var message:String;
		public var id:int;
		
		/**
		 * Creates a new <code>ErrorCodeVO</code> object.
		 *  
		 * @param message A string associated with the error object.
		 * @param id A reference number to associate with the specific error message.
		 * 
		 */
		public function ErrorCodeVO(message:String, id:int)
		{
			this.message = message;
			this.id = id;
		}
	}
}