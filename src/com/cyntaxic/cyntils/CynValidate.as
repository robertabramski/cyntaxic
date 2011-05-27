package com.cyntaxic.cyntils
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
		public static const IP_CONTAINS_INVALID_CHARS:int = 6007;
		public static const IP_INCORRECT_PERIODS:int = 6008;
		public static const IP_FIRST_VALUE_ZERO:int = 6009;
		public static const IP_PART_NOT_VALID_NUM:int = 6010;
		public static const URL_LENGTH_INVALID:int = 6011;
		public static const URL_INVALID_PROTOCOL:int = 6012;
		public static const URL_INVALID_CHARS:int = 6013;
		public static const URL_INVALID_DOMAIN_NAME:int = 6014;
		public static const URL_CAN_HAVE_1_QUESTION_MARK:int = 6015;
		public static const EMAIL_INVALID_CHARS:int = 6016;
		public static const EMAIL_CAN_HAVE_1_AT_SIGN:int = 6017;
		public static const EMAIL_USERNAME_BLANK:int = 6018;
		public static const EMAIL_INVALID_DOMAIN:int = 6019;
		public static const EMAIL_INVALID_DOMAIN_EXT:int = 6020;
		public static const SSN_INVALID_CHARS:int = 6021;
		public static const SSN_INVALID_FORMAT:int = 6022;
		public static const SSN_TOO_MANY_DASHES:int = 6023;
		public static const SSN_TOO_LONG:int = 6024;
		
		private static const DECIMAL_DIGITS:String = "01234567890";
		private static const LC_ROMAN_LETTERS:String = "abcdefghijklmnopqrstuvwxyz";
		
		public static var passFail:Boolean = false;
		
		/** 
		 * Casts a string as a number. If it fails, returns false.
		 *
		 * @param n The String of the number to validate
		 * @return A Boolean true value if the data is valid
		 * 
		 */
		public static function digit(value:String):Boolean
		{
			if(value == "" || value == null || value.length != 1)
			{
				return false;
			}
			
			return ! isNaN(parseInt(value));
		}

		/**
		 * Determines if n is within A-Z or a-z
		 *
		 * @param n The character to validate
		 * @return A Boolean true value if the data is valid
		 * 
		 */
		public static function letter(value:String):Boolean
		{
			if(value == "" || value == null || value.length != 1)
			{
				return false;
			}
			
			return LC_ROMAN_LETTERS.indexOf(value.toLowerCase()) != -1;
		}

		/**
		 * Determines whether the string contains only alphabetic and numeric characters
		 *
		 * @param str The string to validate
		 * @return A Boolean true value if the data is valid
		 */
		public static function alphaNumeric(value:String):Boolean 
		{
			return validChars(value, DECIMAL_DIGITS + LC_ROMAN_LETTERS);
		}

		/**
		 * Does the character contain an alphabetic character or number
		 *
		 * @param n The character to validate
		 * @return A Boolean true value if the data is valid
		 * 
		 */
		public static function letterOrDigit(value:String):Boolean
		{
			if (value.length != 1) return false;
			var result:Boolean = (letter(value) || digit(value)); 
			return result;
		}
		
		/**
		 * Is a String a valid Social Security Number
		 * Valid examples are 111-11-1111 or 111111111
		 *
		 * @param inStr The string that will be validated
		 * @return An as3ValidationResult.result true value if the data is valid. If the data is invalid, then
		 * as3Validation.result is set to false and the errorStr provides a brief description.
		 * 
		 */
		public static function socialSecurity(value:String):Object
		{
			var ss:String = value.toString();

			if(!validChars(ss, DECIMAL_DIGITS + "-"))
				return passFail ? false : new Result(false, SSN_INVALID_CHARS, 'The SSN contains invalid characters. Only 0-9 and "-" are allowed.');
			
			if(ss.indexOf("-") > -1)
			{
				if(ss.charAt(3) != "-" || ss.charAt(6) != "-")
					return passFail ? false : new Result(false, SSN_INVALID_FORMAT, "The SSN does not adhere to a ###-##-#### format."); 
				
				var parts:Array = ss.split("-");
				
				if(parts.length != 3)
					return passFail ? false : new Result(false, SSN_TOO_MANY_DASHES, "Too many dashes are in the string."); 
				
				ss = parts.join("");
			}
			
			if(ss.length != 9)
				return passFail ? false : new Result(false, SSN_TOO_LONG, "The SSN is too long."); 
			
			return passFail ? true : new Result(true, VALID);
		}
		
		/**
		 * Determines whether a string is an email address.
		 * Checks for common email address formats but it does not support the full RFC definition
		 *
		 * @param str The string containing the email address
		 * @return An as3ValidationResult.result true value if the data is valid. If the data is invalid, then
		 * as3Validation.result is set to false and the errorStr provides a brief description.
		 * 
		 */
		public static function email(value:String):Object
		{
			var vResult:Object = new Object();
			value = value.toLowerCase();

			if(!validChars(value, DECIMAL_DIGITS + LC_ROMAN_LETTERS + "-_.@"))
				return passFail ? false : new Result(false, EMAIL_INVALID_CHARS, "The email address contains invalid characters.");
			
			var parts:Array = value.split("@");

			if(parts.length != 2)
				return passFail ? false : new Result(false, EMAIL_CAN_HAVE_1_AT_SIGN, 'The email address can contain only one "@" character.');
			
			var username:String = parts[0];
			
			if(username.length == 0)
				return passFail ? false : new Result(false, EMAIL_USERNAME_BLANK, "The username can not be blank.");
			
			var domain:Array = parts[1].split(".");

			if(domain.length < 2 || domain[0].length < 1)
				return passFail ? false : new Result(false, EMAIL_INVALID_DOMAIN, "Invalid domain name."); 
			
			var ext:Object = domain.pop();
			
			if(ext.toString().length < 2 || ext.toString().length == 5 || ext.toString().length > 6)
				return passFail ? false : new Result(false, EMAIL_INVALID_DOMAIN_EXT, "Invalid domain extension.");
			
			return passFail ? true : new Result(true, VALID);
		}
		
		/**
		 * Performs basic checks to determine if a string is a valid HTTPS URL
		 *
		 * @param str The string containing the HTTPS URL
		 * @param domain The expected domain for the URL (optional)
		 * @return An as3ValidationResult.result true value if the data is valid. If the data is invalid, then
		 * as3Validation.result is set to false and the errorStr provides a brief description.
		 * 
		 */
		public static function urlSecure(value:String):Object
		{
			return url(value, true);
		}
		
		/**
		 * Performs basic checks to determine if a string is a valid HTTP or HTTPS URL
		 *
		 * @param str The string containing the URL
		 * @param domain The expected domain for the URL (optional)
		 * @param isSSL A boolean value that is set to true for HTTPS URLs (optional)
		 * @return An as3ValidationResult.result true value if the data is valid. If the data is invalid, then
		 * as3Validation.result is set to false and the errorStr provides a brief description.
		 * 
		 */
		public static function url(value:String, ssl:Boolean = false):Object
		{
			var value:String = value.toLowerCase();

			if(value.length < (ssl ? 12 : 11) || value.length > 4096) 
				return passFail ? false : new Result(false, URL_LENGTH_INVALID, "The string is an invalid length.");

			var startIndex:int;
			var startLen:int;
			
			if(ssl) { startIndex = value.indexOf("https://"); startLen = 8; }
			else { startIndex = value.indexOf("http://"); startLen = 7; }

			if(startIndex != 0)
				return passFail ? false : new Result(false, URL_INVALID_PROTOCOL, "The URL contains an invalid protocol."); 

			if(!validChars(value, DECIMAL_DIGITS + LC_ROMAN_LETTERS + "-_.:/?&%#=+~"))
				return passFail ? false : new Result(false, URL_INVALID_CHARS, "The URL contains invalid characters.");
			
			var tempDomain:String;
			
			if(value.indexOf("/", startLen + 1) > 0) tempDomain = value.substr(startLen, value.indexOf("/", startLen + 1) - startLen);
			else tempDomain = value.substring(startLen, value.length);
			
			if(!validChars(tempDomain, DECIMAL_DIGITS + LC_ROMAN_LETTERS + "-."))
				return passFail ? false : new Result(false, URL_INVALID_DOMAIN_NAME, "The URL contans an invalid domain name.");
			
			if((value.indexOf("?") > startLen + 1) && (value.indexOf("?") != value.lastIndexOf("?")))
				return passFail ? false : new Result(false, URL_CAN_HAVE_1_QUESTION_MARK, 'The URL can contain only one "?" seperator.');
			
			return passFail ? true : new Result(true, VALID);
		}
		
		/**
		 * Determine whether a string is a valid IP address
		 *
		 * @param value The string containing the IP address
		 * @return An result true value if the data is valid.  If the data is invalid, then
		 * result is set to false and the errorStr provides a brief description.
		 * 
		 */
		public static function ip(value:String):Object
		{
			if(!validChars(value, DECIMAL_DIGITS + "."))
				return passFail ? false : new Result(false, IP_CONTAINS_INVALID_CHARS, "The string contains invalid characters.");
			
			var parts:Array = value.split(".");
			
			if(parts.length != 4)
				return passFail ? false : new Result(false, IP_INCORRECT_PERIODS, "There are an incorrect amount of periods in the string.");
				
			if(parseInt(parts[0]) == 0)
				return passFail ? false : new Result(false, IP_FIRST_VALUE_ZERO, "The first value can not be zero.");
			
			for(var i:int = 0; i < parts.length; i++) 
			{
				if((parts[i].length == 0) || (parseInt(parts[i]) > 255 || parseInt(parts[i]) < 0))
					return passFail ? false : new Result(false, IP_PART_NOT_VALID_NUM, "The value " + parts[i] + " is not a valid number.");
			}
			
			return passFail ? true : new Result(true, VALID);
		}
		
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
		
		/**
		 * Determines whether the string contains a valid day-first format date
		 *
		 * @param str The string containing a date in a day-first format
		 * @return A Boolean true value if the date is a valid day-first date
		 * 
		 */
		public static function worldDate(value:String):Object
		{
			return date(value, true);
		}
		
		/**
		 * Determines if the string contains a valid date.
		 * Valid Examples include 9/30/09, 9-30-09 or 9.30.09
		 *
		 * @param str The String containing the date
		 * @param dayFirst Whether the date is in a day first format
		 * @return A result object or boolean value
		 * 
		 */
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
			else return new Result(false, DATE_INCORRECT_FORMAT, "The string is in an incorrect format.");
			
			if(parts.length != 3) 
				return passFail ? false : new Result(false, DATE_TOO_MANY_SEPARATORS, "Too many separators.");
			
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
			else if(yearLen != 4) return passFail ? false : new Result(false, DATE_INCORRECT_YEAR, "Incorrect year.");
			
			if(!integerInRange(month.toString(), 1, 12))
			{
				return passFail ? false : new Result(false, DATE_MONTH_OUT_OF_RANGE, "The month is out of range.");
			}
			
			if(!integerInRange(day.toString(), 1, 31))
			{
				return passFail ? false : new Result(false, DATE_DAY_OUT_OF_RANGE, "The day is out of range.");
			}
			
			var dt:Date = new Date(year, month - 1, day);

			if(dt.getMonth() != month - 1)
			{
				return passFail? false : new Result(false, DATE_CANT_CONVERT_TO_DATE, "Could not convert to a valid date.");
			}
			
			return passFail ? true : new Result(true, VALID);
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
		 * 
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

internal class Result extends Object
{
	private var _valid:Boolean;
	private var _code:int;
	private var _text:String;

	public function Result(valid:Boolean, code:int, text:String = "")
	{
		_valid = valid;
		_code = code;
		_text = text;
	}
	
	public function get valid():Boolean { return _valid; }
	public function get code():int { return _code; }
	public function get text():String { return _text; }
}


