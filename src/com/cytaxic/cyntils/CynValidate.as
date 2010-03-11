package com.cytaxic.cyntils
{
	public class CynValidate
	{
		public static const VALID:int = 6000;
		public static const DATE_MONTH_OUT_OF_RANGE:int = 6001;
		public static const DATE_DAY_OUT_OF_RANGE:int = 6002;
		public static const DATE_INCORRECT_FORMAT:int = 6003;
		public static const DATE_TOO_MANY_SEPARATORS:int = 6004;
		public static const DATE_INCORRECT_YEAR:int = 6005;
		public static const DATE_CANT_CONVERT_TO_DATE:int = 6006;
		
		private static const DECIMAL_DIGITS:String = "01234567890";
		private static const LC_ROMAN_LETTERS:String = "abcdefghijklmnopqrstuvwxyz";
		
		public static var passFail:Boolean = false;
		
		/**
		 * Compare a string against a list of characters to determine if the string does not
		 * contain those characters. This comparison is not case-senstive and it does not
		 * validate that the characters are in a particular order.
		 *
		 * @param value The string that needs to be validated.
		 * @param chars The list of valid characters for that string.
		 * 
		 * @return A Boolean true value if the data is valid.
		 * 
		 */
		public static function invalidChars(value:String, chars:String):Boolean
		{
			for(var i:int = 0; i < value.length; i++)
			{
				if(chars.indexOf(value.charAt(i))) return true;
			}
			
			return false;
		}

		/**
		 * Compare a string against a list of characters to determine if the string contains
		 * only those characters. This comparison is not case-sensitive and does not validate
		 * the order of the characters.
		 *
		 * @param value The string that needs to be validated.
		 * @param chars The list of valid characters for that string.
		 * 
		 * @return A Boolean true value if the data is valid.
		 * 
		 */
		public static function validChars(value:String, chars:String):Boolean
		{
			var value:String = value.toLowerCase();
			if(value.length == 0) return false;

			var chars:String = chars.toLowerCase();
			var arr:Array = value.split("");
			var len:int = arr.length;

			for(var i:int = 0; i < len; i++)
			{
				var valid:Boolean = (chars.indexOf(arr[i]) != -1);
				if(!valid) return false;
			}
			
			return true;
		}
		
		public static function date(value:String, dayFirst:Boolean = false):Object
		{
			var value:String = value.split(" ").join("");

			var dash:Boolean = (value.indexOf("-") != -1);
			var slash:Boolean = (value.indexOf("/") != -1);
			var period:Boolean = (value.indexOf(".") != -1);
			var parts:Array;

			if(dash && !slash && !period) parts = value.split("-"); else 
			if(slash && !dash && !period) parts = value.split("/"); else 
			if(period && !dash && !slash) parts = value.split(".");
			else return new CynValidator(false, DATE_INCORRECT_FORMAT, "The string is in an incorrect format.");
			
			if(parts.length != 3) 
				return passFail ? false : new CynValidator(false, DATE_TOO_MANY_SEPARATORS, "Too many separators.");
			
			var month:int, day:int;

			if(dayFirst == true)
			{
				day = parseInt(parts[0]);
				month = parseInt(parts[1]);
			}
			else 
			{
				month = parseInt(parts[0]);
				day = parseInt(parts[1]);
			}
			
			var year:int = parseInt(parts[2]);
			var yearLen:int = parts[2].length;

			if(yearLen == 2) year = parseInt("20" + parts[2]);
			else if(yearLen != 4) return passFail ? false : new CynValidator(false, DATE_INCORRECT_YEAR, "Incorrect year.");
			
			if(!integerInRange(month.toString(), 1, 12))
			{
				return passFail ? false : new CynValidator(false, DATE_MONTH_OUT_OF_RANGE, "The month is out of range.");
			}
			
			if(!integerInRange(day.toString(), 1, 31))
			{
				return passFail ? false : new CynValidator(false, DATE_DAY_OUT_OF_RANGE, "The day is out of range.");
			}
			
			var dt:Date = new Date(year, month - 1, day);

			if(dt.getMonth() != month - 1)
			{
				return passFail? false : new CynValidator(false, DATE_CANT_CONVERT_TO_DATE, "Could not convert to a valid date.");
			}
			
			return passFail ? true : new CynValidator(true, VALID);
		}
		
		/**
		 * Determines whether the integer with a specified range.
		 *
		 * @param n The String representing the number to Valid
		 * @param min The minimum value as a Number (>= comparison)
		 * @param max The maxium value  as a Number (<= comparison)
		 * @return A Boolean true value if the data is within the range
		 * 
		 */
		public static function integerInRange(value:String, min:int, max:int):Boolean
		{
			var n:int = parseInt(value);
			
			if(isNaN(n) || isNaN(min) || isNaN(max)) return false;
			if(min > max) return false;
			if(n != Math.round(n)) return false;

			return (n >= min && n <= max);
		}
		
		/**
		 * Determines whether the string contains data
		 *
		 * @param str The character to validate
		 * @param white A boolean when set to false will ignore white space (space, newline, tab)
		 * @return A Boolean true value if the string is not empty
		 */
		public static function notEmpty(value:String, white:Boolean = false):Boolean
		{
			if(white == false) 
			{
				value = value.split(" ").join("");
				value = value.split("\n").join("");
				value = value.split("\t").join("");
			}
			
			return value.length > 0;
		}
	}
}

internal class CynValidator extends Object
{
	public var valid:Boolean;
	public var code:int;
	public var text:String = "";
	
	public function CynValidator(valid:Boolean, code:int, text:String = "")
	{
		this.valid = valid;
		this.code = code;
		this.text = text;
	}
}


