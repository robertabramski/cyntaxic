package com.cyntaxic.cyngle.controller.enums
{
	import com.cyntaxic.cyngle.controller.vos.ErrorCodeVO;
	
	public class ErrorCodes
	{
		public static const E_5000:ErrorCodeVO = new ErrorCodeVO("Error #5000: Property is only set once in Cyntaxic.", 5000);
		public static const E_5001:ErrorCodeVO = new ErrorCodeVO("Error #5001: Object does not extend CynView. Use removeChildAt to remove.", 5001);
		public static const E_5002:ErrorCodeVO = new ErrorCodeVO("Error #5002: Event listening on the controller is not supported.", 5002);
	}
}