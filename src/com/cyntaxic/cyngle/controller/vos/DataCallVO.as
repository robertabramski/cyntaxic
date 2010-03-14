package com.cyntaxic.cyngle.controller.vos
{
	import com.cyntaxic.cyngle.CyntaxicVO;
	import com.cyntaxic.cynccess.cynternal;

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
		
		override public function describe(deep:Boolean = false):String
		{
			var description:String = "{";
		
			for(var appendedProp:String in props)
			{
				if(appendedProp == "data") description += appendedProp + ":" + compact(this[appendedProp]) + ", ";
				else description += appendedProp + ":" + this[appendedProp] + ", ";
			}
			
			for(var dynamicProp:String in this)
			{
				if(dynamicProp == "data") description += appendedProp + ":" + compact(this[appendedProp]) + ", ";
				else description += dynamicProp + ":" + this[dynamicProp] + ", ";
			}
			
			description += "}";
			description = description.replace(", }", "}");
			
			return description;
		}
		
		private function compact(value:String):String
		{
			return value.split("\n").join("").split("\t").join("").split("\r").join("");
		}
		
		public function get url():String 
		{
			return _url;
		}

		public function set url(value:String):void 
		{
			_url = append("url", value);
		}

		public function get method():String 
		{
			return _method;
		}

		public function set method(value:String):void 
		{
			_method = append("method", value);
		}

		public function get data():Object 
		{
			return _data;
		}

		public function set data(value:Object):void 
		{
			_data = append("data", value);
		}

		public function get contentType():String 
		{
			return _contentType;
		}

		public function set contentType(value:String):void 
		{
			_contentType = append("contentType", value);
		}
	}
}