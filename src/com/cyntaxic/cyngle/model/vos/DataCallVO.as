package com.cyntaxic.cyngle.model.vos
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.CyntaxicVO;

	public class DataCallVO extends CyntaxicVO
	{
		use namespace cynternal;
		
		public static const GET:String = "get";
		public static const POST:String = "post";

		private var _url:String;
		private var _method:String;
		private var _data:Object;
		private var _contentType:String;
		
		public function DataCallVO(url:String = "", method:String = "get", data:Object = null, contentType:String = "text/plain")
		{
			this.url = url;
			this.method = method;
			this.data = data;
			this.contentType = contentType;
		}
		
		public function get url():String { return _url; }
		public function set url(value:String):void { _url = value; }

		public function get method():String { return _method; }
		public function set method(value:String):void { _method = value; }

		public function get data():Object { return _data; }
		public function set data(value:Object):void { _data = value; }

		public function get contentType():String { return _contentType; }
		public function set contentType(value:String):void { _contentType = value; }
	}
}