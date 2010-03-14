package com.cyntaxic.cyngle.model
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.model.enums.Messages;
	import com.cyntaxic.cyngle.model.enums.Versions;
	import com.cyntaxic.cyngle.model.vos.VersionVO;
	import com.cyntaxic.cynccess.cynternal;
	
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
			if(Cyntaxic.DEEP_DEBUG) Cyntaxic.DEBUGGER.log(this, Messages.INIT);
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