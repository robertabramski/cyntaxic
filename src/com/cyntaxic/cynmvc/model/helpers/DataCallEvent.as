package com.cyntaxic.cynmvc.model.helpers
{
	import com.cyntaxic.cynmvc.model.vos.DataCallVO;
	
	import flash.events.Event;

	/**
	 * The <code>DataCallEvent</code> class dispatches <code>DataCallEvent</code> 
	 * objects when a <code>DataCall</code> object retrieves information from a server.
	 *  
	 * @author robertabramski
	 * 
	 */	
	public class DataCallEvent extends Event
	{
		/**
		 *  Used to specify a <code>DataCallEvent</code> timeout.
		 */
		public static const TIMEOUT:String = "timeout";
		
		/**
		 * Used to specify a completion of a <code>DataCall</code>.
		 */		
		public static const COMPLETE:String = "complete";
		
		/**
		 * Used to specify a <code>DataCall</code> input/output error.
		 */		
		public static const IO_ERROR:String = "ioError";
		
		private var _data:DataCallVO;
		private var _handle:String;
		
		/**
		 * Creates an <code>DataCallEvent</code> object. The event is fired when the 
		 * <code>DataCall</code> object retrieves information from a server.
		 *  
		 * @param type The type of the event.
		 * @param handle The function name of the callback function made in the controller when the call is complete.
		 * @param data The data object to be sent to the server as either GET or POST.
		 * @param bubbles Determines whether the Event object bubbles. Event listeners can access this information through the inherited bubbles property.
		 * @param cancelable Determines whether the Event object can be canceled. Event listeners can access this information through the inherited cancelable property.
		 * 
		 */
		public function DataCallEvent(type:String, handle:String, data:DataCallVO = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			_handle = handle;
			_data = data;
			
			super(type, bubbles, cancelable);
		}
		
		/**
		 * The data from the server as a value object.
		 *  
		 * @return The data from the server as a value object. 
		 * 
		 */
		public function get data():DataCallVO { return _data; }
		
		/**
		 * The string value of the callback function handle.
		 *  
		 * @return The string value of the callback function handle. 
		 * 
		 */
		public function get handle():String { return _handle; }
		public function set handle(value:String):void { _handle = value; }
	}
}