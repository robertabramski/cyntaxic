package com.cytaxic.cyngle.model
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.model.enums.Messages;
	import com.cytaxic.cyngle.model.enums.Versions;
	import com.cytaxic.cyngle.model.vos.VersionVO;
	import com.cytaxic.cynccess.cyntaxic;
	
	import flash.events.EventDispatcher;
	
	public dynamic class CynModel extends EventDispatcher
	{
		use namespace cyntaxic;
		
		private var _version:VersionVO = Versions.VERSION_0_0_1;
		private var _views:Array = [];
		
		public function CynModel()
		{
			
		}
		
		cyntaxic function init():CynModel
		{
			Cyntaxic.DEBUGGER.log(this, Messages.INIT);
			return this;
		}
		
		cyntaxic function get version():VersionVO
		{
			return _version;
		}
		
		cyntaxic function get views():Array 
		{
			return _views;
		}

		cyntaxic function set views(value:Array):void 
		{
			_views = value;
		}
	}
}