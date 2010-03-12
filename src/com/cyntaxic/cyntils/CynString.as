package com.cyntaxic.cyntils
{
	public class CynString
	{
		public static function replaceAll(original:String, find:String, replace:String):String
		{
			return original.split(find).join(replace);
		}
	}
}