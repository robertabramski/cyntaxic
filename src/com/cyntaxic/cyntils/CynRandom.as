package com.cyntaxic.cyntils
{
	/**
	 * The <code>CynRandom</code> class contains static functions for
	 * randomization.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class CynRandom
	{
		/**
		 * Returns an array of zero based indexed numbers randomly.
		 *  
		 * @param length The length of the array to be generated.
		 * @return The array of random numbers in length range.
		 * 
		 */
		public static function arrayOfIndex(length:int = 0):Array
		{
			var arr:Array = [];
			var s:Array = [];
			var i:int = length;
			while (i--) s.unshift(i);
			while (s.length) arr.push(s.splice(Math.random() * (s.length - 1)));
			
			return arr;
		}
		
		/**
		 * Returns an array of single digit zero based indexed numbers randomly.
		 *  
		 * @param length The length of the array to be generated.
		 * @return The array of single random numbers in length range.
		 * 
		 */
		public static function arrayOfSingleDigits(length:int = 0):Array
		{
			var arr:Array = [];
			for(var i:int = 0; i < length; i++) arr.push(Math.floor(Math.random() * 10));
			
			return arr;
		}
		
		/**
		 * Returns a random number a specified number of digits long.
		 *  
		 * @param length The length of digits to return.
		 * @return The random number generated.
		 * 
		 */
		public static function numberByLength(length:int = 0):Number
		{
			var st:String = "";
			var nums:Array = CynRandom.arrayOfSingleDigits(length);
			for(var i:int = 0; i < nums.length; i++) st += nums[i] == 0 && i == 0 ? "1" : nums[i];	
			
			return Number(st);
		}
		
		/**
		 * Returns a random number in range.
		 *  
		 * @param low The low range.
		 * @param high The high range.
		 * @param integer If false, allow floating point number otherwise integer.
		 * @return The random number in range generated.
		 * 
		 */		
		public static function numberInRange(low:Number, high:Number, integer:Boolean = true):Number
		{
			return integer ? Math.round(Math.random() * (high - low)) + low : Math.random() * (high - low) + low;
		}
	}
}