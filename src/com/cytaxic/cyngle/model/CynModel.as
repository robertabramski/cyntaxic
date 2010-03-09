package com.cytaxic.cyngle.model
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.model.enums.Messages;
	import com.cytaxic.cyngle.model.enums.Versions;
	import com.cytaxic.cyngle.model.vos.VersionVO;
	
	import flash.events.EventDispatcher;
	
	public dynamic class CynModel extends EventDispatcher
	{
		private var _version:VersionVO = Versions.VERSION_0_0_1;
		
		public function CynModel()
		{
			
		}
		
		public function init():CynModel
		{
			Cyntaxic.DEBUGGER.log(this, Messages.INIT);
			return this;
		}
		
		public function get version():VersionVO
		{
			return _version;
		}
	}
}