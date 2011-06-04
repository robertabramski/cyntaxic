package com.cyntaxic.cynmvc.controller.enums
{
	import com.cyntaxic.cynmvc.controller.vos.ErrorCodeVO;
	
	public class ErrorCodes
	{
		public static const E_1000:ErrorCodeVO = new ErrorCodeVO("CynError #1000: Property is only set once in Cyntaxic.", 1000);
		public static const E_1001:ErrorCodeVO = new ErrorCodeVO("CynError #1001: Object does not extend CynView. Use removeChildAt to remove.", 1001);
		public static const E_1002:ErrorCodeVO = new ErrorCodeVO("CynError #1002: Event listening on the controller is not supported.", 1002);
		public static const E_1003:ErrorCodeVO = new ErrorCodeVO("CynError #1003: CynController and CynModel are meant to be abstract. The extended constructor should pass itself to the superclass. In the constructor write the following: super(this).", 1003);
	}
}