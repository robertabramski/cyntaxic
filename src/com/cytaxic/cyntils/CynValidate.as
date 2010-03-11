package com.cytaxic.cyntils
{
	public class CynValidate
	{
		public static const VALID:int = 0;
		public static const DATE_MONTH_OUT_OF_RANGE:int = 6001;
		public static const DATE_DAY_OUT_OF_RANGE:int = 6002;
		public static const DATE_INCORRECT_FORMAT:int = 6003;
		public static const DATE_TOO_MANY_SEPARATORS:int = 6004;
		public static const DATE_INCORRECT_YEAR:int = 6005;
		public static const DATE_CANT_CONVERT_TO_DATE:int = 6006;
		
		public static function date(value:String, dayFirst:Boolean = false):CynValidator
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
			
			if(parts.length != 3) return new CynValidator(false, DATE_TOO_MANY_SEPARATORS, "Too many separators.");
			
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
			else if(yearLen != 4) return new CynValidator(false, DATE_INCORRECT_YEAR, "Incorrect year.");
			
			if(!integerInRange(month.toString(), 1, 12))
			{
				return new CynValidator(false, DATE_MONTH_OUT_OF_RANGE, "The month is out of range.");
			}
			
			if(!integerInRange(day.toString(), 1, 31))
			{
				return new CynValidator(false, DATE_DAY_OUT_OF_RANGE, "The day is out of range.");
			}
			
			var dt:Date = new Date(year, month - 1, day);

			if(dt.getMonth() != month - 1)
			{
				return new CynValidator(false, DATE_CANT_CONVERT_TO_DATE, "Could not convert to a valid date.");
			}
			
			return new CynValidator(true, VALID);
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
		 * @param str The character to Valid
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


