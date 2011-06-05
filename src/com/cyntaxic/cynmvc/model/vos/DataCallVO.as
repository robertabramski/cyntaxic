package com.cyntaxic.cynmvc.model.vos
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cynmvc.Cyntaxic;
	import com.cyntaxic.cynmvc.CyntaxicVO;

	/**
	 * The <code>DataCallVO</code> class is a value object used to contain information about a <code>DataCall</code>.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class DataCallVO extends CyntaxicVO
	{
		use namespace cynternal;
		
		/**
		 * Used to specify the HTTP GET type.
		 */		
		public static const GET:String = "get";
		
		/**
		 * Used to specify the HTTP POST type.
		 */
		public static const POST:String = "post";

		private var _url:String;
		private var _method:String;
		private var _data:Object;
		private var _contentType:String;
		private var _result:String;
		
		/**
		 * Creates a new <code>DataCallVO</code> object.
		 *  
		 * @param url The URL that is being called.
		 * @param method The HTTP method to use, either GET or POST.
		 * @param data The data object to be sent to the server as either GET or POST.
		 * @param contentType The content type to send to the server.
		 * 
		 */	
		public function DataCallVO(url:String = "", method:String = "get", data:Object = null, contentType:String = "text/plain")
		{
			this.url = url;
			this.method = method;
			this.data = data;
			this.contentType = contentType;
		}
		
		/**
		 * The URL that is being called.
		 *  
		 * @return The URL that is being called.
		 * 
		 */
		public function get url():String { return _url; }
		public function set url(value:String):void { _url = value; }

		/**
		 * The HTTP method to use, either GET or POST.
		 *  
		 * @return The HTTP method to use, either GET or POST.
		 * 
		 */
		public function get method():String { return _method; }
		public function set method(value:String):void { _method = value; }

		/**
		 * The data object to be sent to the server as either GET or POST.
		 *  
		 * @return The data object to be sent to the server as either GET or POST.
		 * 
		 */
		public function get data():Object { return _data; }
		public function set data(value:Object):void { _data = value; }

		/**
		 * The content type to send to the server.
		 *  
		 * @return The content type to send to the server. 
		 * 
		 */
		public function get contentType():String { return _contentType; }
		public function set contentType(value:String):void { _contentType = value; }
		
		/**
		 * The result string indicating if the call was successful or not.
		 *  
		 * @return The result string indicating if the call was successful or not.
		 * 
		 */
		public function get result():String { return _result; }
		public function set result(value:String):void { _result = value; }
	}
}