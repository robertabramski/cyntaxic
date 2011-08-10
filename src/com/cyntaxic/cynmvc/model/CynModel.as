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
	
	import flash.events.EventDispatcher;
	
	/**
	 * <code>CynModel</code> is an abstract class to be extended by the application being 
	 * created with the Cyntaxic framework. The model is where all data for the application
	 * is stored.
	 *  
	 * @author robertabramski
	 * 
	 */
	public dynamic class CynModel extends EventDispatcher
	{
		use namespace cynternal;
		
		private var _version:VersionVO = Versions.VERSION_0_1_1;
		private var _views:Array = [];
		private var call:DataCall;
		
		/**
		 * Creates a new instance of <code>CynModel</code>.
		 * 
		 * @param self Reference to itself to enforce it as an abstract class.
		 * 
		 * @throws CynError If attempted to be extended without <code>super(this)</code>.
		 * 
		 */
		public function CynModel(self:CynModel)
		{
			if(self != this) Cyntaxic.throwError(ErrorCodes.E_1003);
		}
		
		/**
		 * @private
		 * 
		 */
		cynternal function init():CynModel
		{
			return this;
		}
		
		/**
		 * Returns the version number of the framework.
		 * 
		 * @return The version number of the framework.
		 * 
		 */
		public function get version():VersionVO { return _version; }
		
		/**
		 * @private
		 * 
		 */
		cynternal function get views():Array { return _views; } /*** @private */
		cynternal function set views(value:Array):void { _views = value; }
		
		/**
		 * Returns a valid JSON string describing the object. Objects that can't be 
		 * used in JSON like the Function object are returned as a string literal.
		 *  
		 * @param compact If false the string is not compacted.
		 * @return A valid JSON string. 
		 * 
		 */
		public function describe(compact:Boolean = true):String
		{
			return Cyntaxic.describe(this, compact);
		}
		
		/**
		 * Sends a HTTP GET call. When the call is complete the controller 
		 * <code>execute</code> function is called to handle the returned data.
		 * 
		 * @param handle The callback function handle.
		 * @param url The URL to be called.
		 * @param data The data to send to the server. 
		 * @param contentType The content type of the data.
		 * 
		 */
		public function get(handle:String, url:String, data:Object = null, contentType:String = "text/plain"):void
		{
			call = new DataCall(handle, url, DataCall.GET, data, contentType);
			
			call.addEventListener(DataCallEvent.COMPLETE, dispatchCall);
			call.addEventListener(DataCallEvent.IO_ERROR, dispatchCall);
			call.addEventListener(DataCallEvent.TIMEOUT, dispatchCall);
		}
		
		/**
		 * Sends a HTTP POST call. When the call is complete the controller 
		 * <code>execute</code> function is called to handle the returned data.
		 *  
		 * @param handle The callback function handle.
		 * @param url The URL to be called.
		 * @param data The data to send to the server.
		 * @param contentType The content type of the data.
		 * 
		 */
		public function post(handle:String, url:String, data:Object = null, contentType:String = "text/plain"):void
		{
			call = new DataCall(handle, url, DataCall.POST, data, contentType);
			
			call.addEventListener(DataCallEvent.COMPLETE, dispatchCall);
			call.addEventListener(DataCallEvent.IO_ERROR, dispatchCall);
			call.addEventListener(DataCallEvent.TIMEOUT, dispatchCall);
		}
		
		private function dispatchCall(event:DataCallEvent):void
		{
			call.removeEventListener(DataCallEvent.COMPLETE, dispatchCall); 
			call.removeEventListener(DataCallEvent.IO_ERROR, dispatchCall);
			call.removeEventListener(DataCallEvent.TIMEOUT, dispatchCall);
			call = null;
			
			Cyntaxic.execute(event.handle, event.data);
		}
	}
}