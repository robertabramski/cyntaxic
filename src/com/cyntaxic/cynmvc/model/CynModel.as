package com.cyntaxic.cynmvc.model
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cynmvc.Cyntaxic;
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.controller.enums.ErrorCodes;
	import com.cyntaxic.cynmvc.model.enums.Versions;
	import com.cyntaxic.cynmvc.model.helpers.DataCall;
	import com.cyntaxic.cynmvc.model.helpers.DataCallEvent;
	import com.cyntaxic.cynmvc.model.vos.VersionVO;
	
	public dynamic class CynModel extends CyntaxicVO
	{
		use namespace cynternal;
		
		private var _version:VersionVO = Versions.VERSION_1_0_0;
		private var _views:Array = [];
		private var call:DataCall;
		
		public function CynModel(self:CynModel)
		{
			if(self != this) Cyntaxic.CONTROLLER.throwError(ErrorCodes.E_1003);
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
		
		public function get(handle:String, url:String, data:Object = null, contentType:String = "text/plain"):void
		{
			call = new DataCall(handle, url, DataCall.GET, data, contentType);
			call.addEventListener(DataCallEvent.COMPLETE, dispatchCall);
		}
		
		public function post(handle:String, url:String, data:Object = null, contentType:String = "text/plain"):void
		{
			call = new DataCall(handle, url, DataCall.POST, data, contentType);
			call.addEventListener(DataCallEvent.COMPLETE, dispatchCall);
		}
		
		private function dispatchCall(event:DataCallEvent):void
		{
			call.removeEventListener(DataCallEvent.COMPLETE, dispatchCall); 
			call = null;
			
			Cyntaxic.CONTROLLER.execute(event.handle, event.data);
		}
	}
}