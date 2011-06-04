package com.cyntaxic.cynmvc.model.vos
{
	import com.cyntaxic.cynmvc.CyntaxicVO;

	public class VersionVO extends CyntaxicVO
	{
		private var _number:String;
		private var _description:String;
		
		public function VersionVO(number:String, description:String)
		{
			this.number = number;
			this.description = description;
		}
		
		public function get number():String { return _number; }
		public function set number(value:String):void { _number = value; }

		public function get description():String { return _description; }
		public function set description(value:String):void { _description = value; }
	}
}