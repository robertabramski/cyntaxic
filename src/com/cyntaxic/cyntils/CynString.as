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
		
		public static function trim(value:String):String
		{
			//TODO: Test this.
			return value.replace(/^([\s|\t|\n]+)?(.*)([\s|\t|\n]+)?$/gm, "$2");
		}
	}
}