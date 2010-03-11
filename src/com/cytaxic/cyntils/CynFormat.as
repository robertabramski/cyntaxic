package com.cytaxic.cyntils
{
	public class CynFormat
	{
		public static function decimalNumber(number:Number, precision:int):Number
		{
			if((precision = Math.abs(precision)) == 0) return Math.round(number);
			
			return parseFloat(Math.floor(number) + "." + Math.round(number * Math.pow(10, precision)).toString().substr(-precision));	
		}
		
		public static function cash(number:Number, symbol:String = "$", frontSymbol:Boolean = true, splitChar:String = "."):String
		{
			var amount:String = String(decimalNumber(number, 2)).replace(".", splitChar);
			var parts:Array = amount.split(".");
			
			return (frontSymbol ? symbol : "") + amount + (!frontSymbol ? symbol : "");
		}
	}
}