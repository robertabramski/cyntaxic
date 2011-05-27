package com.cyntaxic.cyngle.controller.vos
{
	import com.cyntaxic.cyngle.CyntaxicVO;
	
	public class ErrorCodeVO extends CyntaxicVO
	{
		public var message:String;
		public var id:int;
		
		public function ErrorCodeVO(message:String, id:int)
		{
			this.message = message;
			this.id = id;
		}
	}
}