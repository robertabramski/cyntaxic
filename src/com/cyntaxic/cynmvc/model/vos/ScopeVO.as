package com.cyntaxic.cynmvc.model.vos
{
	import com.cyntaxic.cynmvc.CyntaxicVO;
	
	public class ScopeVO extends CyntaxicVO
	{
		private var _scope:Object;
		private var _handle:String;
		
		public function ScopeVO(scope:Object, handle:String)
		{
			_scope = scope;
			_handle = handle;
		}
		
		public function get scope():Object { return _scope; }
		public function get handle():String { return _handle; }
	}
}