package com.cyntaxic.cyngle
{
	import com.cyntaxic.cynccess.cynternal;
	
	public dynamic class CyntaxicVO extends Object
	{
		use namespace cynternal;
		
		public function CyntaxicVO(data:Object = null)
		{
			if(data)
			{
				for(var prop:String in data)
				{
					this[prop] = data[prop];
				}
			}
		}
		
		public function describe(compact:Boolean = true):String
		{
			return Cyntaxic.describe(this, compact);
		}
	}
}