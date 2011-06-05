package com.cyntaxic.cyntils
{
	/**
	 * The <code>CynArray</code> class contains static functions for
	 * manipulating arrays.
	 * 
	 * @author robertabramski
	 * 
	 */
	public class CynArray
	{
		/**
		 * Shuffles an array without shuffling the original. 
		 * 
		 * @param array The array to shuffle.
		 * @return The shuffled array.
		 * 
		 */
		public static function shuffle(array:Array):Array
		{
			var shuffledArray:Array = [];
			
			while(array.length > 0)
			{
				shuffledArray.push(array.splice(Math.round(Math.random() * (array.length - 1)), 1)[0]);
			}
			
			return shuffledArray;
		}
	}
}