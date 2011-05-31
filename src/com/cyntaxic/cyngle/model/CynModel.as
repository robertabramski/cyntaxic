package com.cyntaxic.cyngle.model
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cyngle.model.enums.Versions;
	import com.cyntaxic.cyngle.model.vos.VersionVO;
	
	public dynamic class CynModel
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
		
		public function get cynViews():Array
		{
			return _views.slice();
		}
	}
}