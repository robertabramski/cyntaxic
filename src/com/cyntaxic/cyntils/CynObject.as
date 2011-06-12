package com.cyntaxic.cyntils
{
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	
	/**
	 * The <code>CynObject</code> class contains static functions for
	 * getting information on objects.
	 *  
	 * @author robertabramski
	 * 
	 */	
	public class CynObject
	{
		/**
		 * Gets name of object similar to how <code>toString</code> works.
		 *  
		 * @param object The object to name.
		 * 
		 * @return A bracketed object string name.
		 * 
		 */
		public static function getObjectName(object:Object):String
		{
			return '[object ' + getQualifiedClassName(object).split('::')[1] + ']';
		}
		
		/**
		 * Gets name of the object's superclass similar to how <code>toString</code> works.
		 *  
		 * @param object The object to name.
		 * 
		 * @return A bracketed object string name.
		 * 
		 */
		public static function getObjectSuperClassName(object:Object):String
		{
			return '[object ' + getQualifiedSuperclassName(object).split('::')[1] + ']';		
		}
		
		/**
		 * Gets the classname of the object.
		 *  
		 * @param object The object to name.
		 * 
		 * @return A string of the class name.
		 * 
		 */
		public static function getClassName(object:Object):String
		{
			return getQualifiedClassName(object).split('::')[1];
		}
		
		/**
		 * Gets the classname of the object's superclass.
		 *  
		 * @param object The object to name.
		 * 
		 * @return A string of the superclass name.
		 * 
		 */
		public static function getSuperClassName(object:Object):String
		{
			return getQualifiedSuperclassName(object).split('::')[1];		
		}
	}
}