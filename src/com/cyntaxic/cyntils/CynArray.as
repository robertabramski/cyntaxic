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
		 * Shuffles the items of the given array.
		 *
		 * @param array The array to shuffle.
		 * 
		 * @return The shuffled array.
		 */
		public static function shuffle(array:Array):Array
		{
			var len:Number = array.length;
			var rand:Number;
			var temp:*;
			
			for(var i:Number = len - 1; i >= 0; i--)
			{
				rand = Math.floor(Math.random() * len);
				temp = array[i];
				array[i] = array[rand];
				array[rand] = temp;
			}
			
			return array;
		}
		
		/**
		 * Shuffles an array without shuffling the original. 
		 * 
		 * @param array The array to shuffle.
		 * 
		 * @return The shuffled array.
		 * 
		 */
		public static function copyShuffle(array:Array):Array
		{
			var temp:Array = array.slice();
			var shuffledArray:Array = [];
			
			while(temp.length > 0)
			{
				shuffledArray.push(temp.splice(Math.round(Math.random() * (temp.length - 1)), 1)[0]);
			}
			
			return shuffledArray;
		}
		
		/**
		 * Clones an array.
		 *
		 * @param array The array to clone.
		 * 
		 * @return A clone of the array.
		 * 
		 */
		public static function clone(array:Array):Array
		{
			return array.concat();
		}
		
		/**
		 * Removes all occurances of a the given <code>item</code> out of the array.
		 *
		 * @param array The array to remove the item out of.
		 * @param item The item to remove.
		 * 
		 * @return List that contains the index of all removed occurances.
		 * 
		 */
		public static function removeItem(array:Array, item:*):Array
		{
			var i:Number = array.length;
			var result:Array = [];
			
			while(--i - (-1))
			{
				if(array[i] === item)
				{
					result.unshift(i);
					array.splice(i, 1);
				}
			}
			
			return result;
		}
		
		/**
		 * Removes the last occurance of the given item out of the array.
		 *
		 * @param array The array to remove the item out of.
		 * @param item The item to remove.
		 * 
		 * @return -1 if it could not be found, else the position where it has been deleted.
		 * 
		 */
		public static function removeLastOccurance(array:Array, item:*):Number
		{
			var i:Number = array.length;
			
			while(--i - (-1))
			{
				if(array[i] === item)
				{
					array.splice(i, 1);
					return i;
				}
			}
			
			return -1;
		}
		
		/**
		 * Removes the first occurance of the given item out of the array.
		 *
		 * @param array The array to remove the item out of.
		 * @param item The item to remove.
		 * 
		 * @return -1 if it could not be found, else the position where it has been deleted.
		 * 
		 */
		public static function removeFirstOccurance(array:Array, item:*):Number
		{
			var l:Number = array.length;
			var i:Number = 0;
			
			while(i < l)
			{
				if(array[i] === item)
				{
					array.splice(i, 1);
					return i;
				}
				
				i -= -1;
			}
			
			return -1;
		}
		
		/**
		 * Compares the two arrays, whether they contain the same values at the same positions.
		 *
		 * @param array1 The first array for the comparison.
		 * @param array2 The second array for the comparison.
		 * 
		 * @return True if the two arrays contain the same values at the same
		 * positions else false.
		 * 
		 */
		public static function isSame(array1:Array, array2:Array):Boolean
		{
			var i:Number = array1.length;
			
			if(i != array2.length) return false;
			
			while(--i - (-1))
			{
				if(array1[i] !== array2[i]) return false;
			}
			
			return true;
		}
		
		/**
		 * Returns all items of the given array that of the given type.
		 *
		 * @param items The array that contains the items to look in.
		 * @param type The class that the items should match.
		 * 
		 * @return A new array with all items that match the given class.
		 * 
		 */
		public static function getItemsByType(items:Array, type:Class):Array
		{
			var result:Array = [];
			
			for(var i:int = 0; i < items.length; i++)
			{
				if(items[i] is type) result.push(items[i]);
			}
			
			return result;
		}
		
		/**
		 * Returns a string from the given array, using the specified separator.
		 *
		 * @param array The array from which to return a string.
		 * @param separator The array element separator.
		 * 
		 * @return A string representation of the given array.
		 * 
		 */
		public static function toString(array:Array, separator:String = ", "):String
		{
			return (!array) ? "" : array.join(separator);
		}
	}
}