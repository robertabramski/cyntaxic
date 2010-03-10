package com.cytaxic.cyntils
{
	public class CynRandom
	{
		public static function arrayOfIndex(length:int = 0):Array
		{
			var arr:Array = [];
			var s:Array = [];
			var i:int = length;
			while (i--) s.unshift(i);
			while (s.length) arr.push(s.splice(Math.random() * (s.length - 1)));
			
			return arr;
		}
		
		public static function arrayOfSingleDigits(length:int = 0):Array
		{
			var arr:Array = [];
			for(var i:int = 0; i < length; i++) arr.push(Math.floor(Math.random() * 10));
			
			return arr;
		}
		
		public static function numberByLength(length:int = 0):Number
		{
			var st:String = "";
			var nums:Array = CynRandom.arrayOfSingleDigits(length);
			for(var i:int = 0; i < nums.length; i++) st += nums[i] == 0 && i == 0 ? "1" : nums[i];	
			
			return Number(st);
		}
		
		public static function numberInRange(low:Number, high:Number, integer:Boolean = true):Number
		{
			return integer ? Math.round(Math.random() * (high - low)) + low : Math.random() * (high - low) + low;
		}
	}
}