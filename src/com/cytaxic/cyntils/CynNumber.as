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