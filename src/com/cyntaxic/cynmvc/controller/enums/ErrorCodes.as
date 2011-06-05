package com.cyntaxic.cynmvc.controller.enums
{
	import com.cyntaxic.cynmvc.controller.vos.ErrorCodeVO;
	
	/**
	 * The <code>ErrorCodes</code> class is an enumeration of constant values used 
	 * for errors thrown by the <code>CynError</code> class.
	 *  
	 * @author robertabramski
	 * 
	 */	
	public class ErrorCodes
	{
		/**
		 * Used to specify when a property is improperly set more than once. 
		 */
		public static const E_1000:ErrorCodeVO = new ErrorCodeVO("CynError #1000: Property is only set once in Cyntaxic.", 1000);
		
		/**
		 * Used to specify when a DisplayObject at index is not of a <code>CynView</code> type.  
		 */		
		public static const E_1001:ErrorCodeVO = new ErrorCodeVO("CynError #1001: Object does not extend CynView. Use removeChildAt to remove.", 1001);
		
		/**
		 * Used to specify when any event listening function such as <code>addEventListener</code>, <code>removeEventListener</code> and <code>hasEventListener</code> has been attempted to be called on the contoller. 
		 */		
		public static const E_1002:ErrorCodeVO = new ErrorCodeVO("CynError #1002: Event listening on the controller is not supported.", 1002);
		
		/**
		 *  Used to specify when abstract enforcement hasn't be satisfied. Error code specifies how to correct the issue.
		 */
		public static const E_1003:ErrorCodeVO = new ErrorCodeVO("CynError #1003: CynController, CynModel, CynView, CynComposite and CynComponent are meant to be abstract. The extended constructor should pass itself to the superclass. In the constructor write the following: super(this).", 1003);
		
		/**
		 *  Used to specify when <code>CynView</code> is attempted to be used directly. Error code specifies how to correct the issue.  
		 */
		public static const E_1004:ErrorCodeVO = new ErrorCodeVO("CynError #1004: CynView is an abstract base class CynComposite and CynComponent. Extend CynComposite or CynComponent instead.", 1004);
	}
}