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
		 * 
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
		 * 
		 * @return The compacted string.
		 * 
		 */
		public static function compact(value:String):String
		{
			return value.split("\n").join("").split("\t").join("").split("\r").join("");
		}
		
		/**
		 * Removes whitespace from the front and the end of the specified string.
		 *  
		 * @param input The string whose beginning and ending whitespace will be removed.
		 * 
		 * @return A string with whitespace removed from the begining and end.
		 * 
		 */
		public static function trim(input:String):String
		{
			return ltrim(rtrim(input));
		}

		/**
		 * Removes whitespace from the front of the specified string.
		 *  
		 * @param input The string whose beginning whitespace will will be removed.
		 * 
		 * @return A string with whitespace removed from the begining.
		 * 
		 */		
		public static function ltrim(input:String):String
		{
			var size:Number = input.length;
			
			for(var i:Number = 0; i < size; i++)
			{
				if(input.charCodeAt(i) > 32)
				{
					return input.substring(i);
				}
			}
			
			return "";
		}

		/**
		 * Removes whitespace from the end of the specified string.
		 *  
		 * @param input The string whose ending whitespace will will be removed.
		 * 
		 * @return A string with whitespace removed from the end.
		 * 
		 */		
		public static function rtrim(input:String):String
		{
			var size:Number = input.length;
			
			for(var i:Number = size; i > 0; i--)
			{
				if(input.charCodeAt(i - 1) > 32)
				{
					return input.substring(0, i);
				}
			}

			return "";
		}
	}
}