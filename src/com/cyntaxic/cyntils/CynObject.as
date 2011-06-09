package com.cyntaxic.cyntils
{
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;

	public class CynObject
	{
		public static function getObjectName(object:Object):String
		{
			return '[object ' + getQualifiedClassName(object).split('::')[1] + ']';
		}
		
		public static function getObjectSuperClassName(object:Object):String
		{
			return '[object ' + getQualifiedSuperclassName(object).split('::')[1] + ']';		
		}
		
		public static function getClassName(object:Object):String
		{
			return getQualifiedClassName(object).split('::')[1];
		}
		
		public static function getSuperClassName(object:Object):String
		{
			return getQualifiedSuperclassName(object).split('::')[1];		
		}
	}
}