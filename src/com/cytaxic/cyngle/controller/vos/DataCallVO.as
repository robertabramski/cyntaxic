package com.cytaxic.cyngle.controller.vos
{
	import com.cytaxic.cyngle.CyntaxicVO;

	public class DataCallVO extends CyntaxicVO
	{
		public static const GET:String = "get";
		public static const POST:String = "post";
		
		public var url:String;
		public var method:String;
		public var data:Object;
		public var contentType:String;
		
		public function DataCallVO(url:String = "", method:String = "get", data:Object = null, contentType:String = "text/plain")
		{
			this.url = append("url", url);
			this.method = append("method", method);
			this.data = append("data", data);
			this.contentType = append("contentType", contentType);
		}
		
		override public function describe():String
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
		
		public function compact(value:String):String
		{
			return value.split("\n").join("").split("\t").join("");
		}
	}
}