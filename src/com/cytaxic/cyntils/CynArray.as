package com.cytaxic.cyntils
{
	public class CynArray
	{
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