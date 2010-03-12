package com.cyntaxic.cyngle.model.vos
{
	import com.cyntaxic.cyngle.CyntaxicVO;

	public class VersionVO extends CyntaxicVO
	{
		public var number:String;
		public var description:String;
		
		public function VersionVO(number:String, description:String)
		{
			this.number = append("number", number);
			this.description = append("description", description);
		}
	}
}