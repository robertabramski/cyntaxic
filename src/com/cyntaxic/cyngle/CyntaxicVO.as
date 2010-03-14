package com.cyntaxic.cyngle
{
	import com.cyntaxic.cynccess.cynternal;
	
	public dynamic class CyntaxicVO extends Object
	{
		use namespace cynternal;
		
		cynternal var props:Object = new Object();
		
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
		
		protected function append(prop:String, value:Object):*
		{	
			props[prop] = value;
			return value;
		}
		
		public function describe(deep:Boolean = false):String
		{
			var description:String = "{";
		
			for(var appendedProp:String in props)
			{
				if(deep && this[appendedProp].hasOwnProperty("describe"))
				{
					description += this[appendedProp].describe();
				}
				
				description += appendedProp + ":" + this[appendedProp] + ", ";
			}
			
			for(var dynamicProp:String in this)
			{
				if(deep && this[dynamicProp].hasOwnProperty("describe"))
				{
					description += this[dynamicProp].describe();
				}
				
				description += dynamicProp + ":" + this[dynamicProp] + ", ";
			}
			
			description += "}";
			description = description.replace(", }", "}");
			
			return description;
		}
	}
}