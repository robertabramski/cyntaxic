package com.cytaxic.cyngle.model
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.model.enums.Messages;
	import com.cytaxic.cyngle.model.enums.Versions;
	import com.cytaxic.cyngle.model.vos.VersionVO;
	import com.cytaxic.cynccess.cynternal;
	
	import flash.events.EventDispatcher;
	
	public dynamic class CynModel extends EventDispatcher
	{
		use namespace cynternal;
		
		private var _version:VersionVO = Versions.VERSION_0_0_1;
		private var _views:Array = [];
		
		public function CynModel()
		{
			
		}
		
		cynternal function init():CynModel
		{
			Cyntaxic.DEBUGGER.log(this, Messages.INIT);
			return this;
		}
		
		cynternal function get version():VersionVO
		{
			return _version;
		}
		
		cynternal function get views():Array 
		{
			return _views;
		}

		cynternal function set views(value:Array):void 
		{
			_views = value;
		}
	}
}