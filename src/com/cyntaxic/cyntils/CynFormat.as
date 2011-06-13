package com.cyntaxic.cyntils
{
	/**
	 * The <code>CynFormat</code> class contains static functions for
	 * formatting.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class CynFormat
	{
		/**
		 * Converts a number into a cash string.
		 *  
		 * @param number The number to be converted.
		 * @param symbol The currency symbol.
		 * @param frontSymbol Flag to use the currency symbol or not.
		 * @param changeSplit The delimiter between dollars and cents.
		 * @param billsSplit The delimiter between thousands of dollars.
		 * 
		 * @return The cash string.
		 * 
		 */
		public static function cash(number:Number, symbol:String = "$", frontSymbol:Boolean = true, changeSplit:String = ".", billsSplit:String = ","):String
		{
			var neg:String = (number > 0 ? "" : "-");
			var amount:String = String(decimalNumber(number, 2)).replace(".", changeSplit);
			var parts:Array = amount.split(".");
			var bills:String = parts[0].replace("-", "");
			var change:String = (parts[1] == null ? "00" : parts[1]);
			var bigBills:String = "";
			
			for(var i:int = 0; i < bills.length; i++)
			{
				if(i > 0 && (i % 3 == 0)) bigBills = billsSplit + bigBills;
				bigBills = parts[0].substr(-i -1, 1) + bigBills;
			}  
			
			return neg + (frontSymbol ? symbol : "") + bigBills + changeSplit + change + (!frontSymbol ? symbol : "");
		}
		
		/**
		 * Converts seconds into formatted hours, minutes and seconds.
		 *  
		 * @param seconds The seconds to be converted.
		 * 
		 * @return The formatted hours, minutes and seconds string.
		 * 
		 */
		public static function time(seconds:Number):String
		{
			seconds = decimalNumber(seconds, 0);
			
			var sec:Number = seconds % 60;
			var min:Number = Math.floor((seconds % 3600)/60);
			var hour:Number = Math.floor(seconds/(60 * 60));
			
			var hourString:String = hour < 10 ? "0" + hour + ":" : hour + ":";
			
			if(hour == 0) hourString = "";
			
			var minuteString:String = min < 10 ? "0" + min + ":" : min + ":";
			var secondString:String = sec < 10 ? "0" + sec : sec.toString();
			
			return hourString + minuteString + secondString;
		}
		
		/**
		 * @private
		 * 
		 */
		private static function decimalNumber(number:Number, precision:int):Number
		{
			if((precision = Math.abs(precision)) == 0) return Math.round(number);
			
			return parseFloat(Math.floor(number) + "." + Math.floor(number * Math.pow(10, precision)).toString().substr(-precision));	
		}
	}
}