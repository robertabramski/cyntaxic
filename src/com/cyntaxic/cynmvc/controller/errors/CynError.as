package com.cyntaxic.cynmvc.controller.errors
{
	/**
	 * The <code>CynError</code> class contains information about an error that 
	 * occurred when using the Cyntaxic framework.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class CynError extends Error
	{
		/**
		 * Creates a new <code>CynError</code> object. If message is specified, its value is assigned 
		 * to the object's <code>message</code> property.
		 *  
		 * @param message A string associated with the error object.
		 * @param id A reference number to associate with the specific error message.
		 * 
		 */
		public function CynError(message:String = "", id:int = 0)
		{
			super(message, id);
		}
	}
}