package com.cytaxic.cyntils
{
	public class CynNumber
	{
		public static function commaFormat(number:Number):String 
		{
			var numString:String = "";
			var numLength:Number = number.toString().length;
			
			for(var i:int = 0; i < numLength; i++)
			{ 
				if((numLength - i) % 3 == 0 && i != 0) numString += ",";
				numString += number.toString().charAt(i);
			}
			
			return numString;
		}
		
		/**
		*	Formats a number to include a leading zero if it is a single digit
		*	between -1 and 10. 	
		* 
		* 	@param n The number that will be formatted
		*
		*	@return A string with single digits between -1 and 10 padded with a 
		*	leading zero.
		*
		* 	@langversion ActionScript 3.0
		*	@playerversion Flash 9.0
		*	@tiptext
		*/		
		public static function addLeadingZero(n:Number):String
		{
			var out:String = String(n);
			
			if(n < 10 && n > -1)
			{
				out = "0" + out;
			}
			
			return out;
		}
		
		public static function getHighest(numbers:Array):Number
		{
			var highest:Number = numbers[0];
			
			for(var i:int = 0; i < numbers.length; i++)
			{
				if(numbers[i] > highest) highest = numbers[i];
			}
			
			return highest;
		}
		
		public static function getLowest(numbers:Array):Number
		{
			var lowest:Number = numbers[0];
			
			for(var i:int = 0; i < numbers.length; i++)
			{
				if(numbers[i] < lowest) lowest = numbers[i];
			}
			
			return lowest;
		}
	}
}