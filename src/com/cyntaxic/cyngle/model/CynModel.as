package com.cyntaxic.cyngle.model
{
	import com.cyntaxic.cyngle.model.enums.Versions;
	import com.cyntaxic.cyngle.model.vos.VersionVO;
	import com.cyntaxic.cynccess.cynternal;
	
	import flash.events.EventDispatcher;
	
	public dynamic class CynModel extends EventDispatcher
	{
		use namespace cynternal;
		
		private var _version:VersionVO = Versions.VERSION_1_0_0;
		private var _views:Array = [];
		
		public function CynModel()
		{
			
		}
		
		cynternal function init():CynModel
		{
			return this;
		}
		
		cynternal function get version():VersionVO { return _version; }
		
		cynternal function get views():Array { return _views; }
		cynternal function set views(value:Array):void { _views = value; }
	}
}