package com.cyntaxic.cyntils
{
	/**
	 * The <code>CynString</code> class contains static functions for 
	 * manipulation of strings.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class CynString
	{
		/**
		 * Replaces all string matches in the string. 
		 *  
		 * @param original The string to search.
		 * @param find The substring to find. 
		 * @param replace The replacement of the substring. 
		 * @return The edited string.
		 * 
		 */
		public static function replaceAll(original:String, find:String, replace:String):String
		{
			return original.split(find).join(replace);
		}
		
		/**
		 * Compact a string. Removes new lines, tabs and carriage returns.
		 *  
		 * @param value The string to compact.
		 * @return The compacted string.
		 * 
		 */
		public static function compact(value:String):String
		{
			return value.split("\n").join("").split("\t").join("").split("\r").join("");
		}
		
		/**
		 * Trim the white space off a string.
		 *  
		 * @param value The string to trim.
		 * @return The trimmed string.
		 * 
		 */		
		public static function trim(value:String):String
		{
			return value.replace(/^([\s|\t|\n]+)?(.*)([\s|\t|\n]+)?$/gm, "$2");
		}
	}
}