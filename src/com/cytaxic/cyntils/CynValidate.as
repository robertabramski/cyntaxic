package com.cytaxic.cyntils
{
	public class CynValidate
	{
		public static function email(address:String):Boolean
		{
			var regex:RegExp = /^[0-9a-zA-Z][-._a-zA-Z0-9]*@([0-9a-zA-Z][-._0-9a-zA-Z]*\.)+[a-zA-Z]{2,4}$/;
			
			if(address.match(regex) == null) return false;
			else return true;
		}
	}
}