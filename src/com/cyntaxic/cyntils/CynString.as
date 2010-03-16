package com.cyntaxic.cyntils
{
	public class CynString
	{
		public static function replaceAll(original:String, find:String, replace:String):String
		{
			return original.split(find).join(replace);
		}
		
		public static function compact(value:String):String
		{
			return value.split("\n").join("").split("\t").join("").split("\r").join("");
		}
	}
}