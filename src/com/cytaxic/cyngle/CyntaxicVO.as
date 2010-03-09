package com.cytaxic.cyngle
{
	public dynamic class CyntaxicVO extends Object
	{
		protected var props:Object = new Object();
		
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
		
		public function describe():String
		{
			var description:String = "{";
		
			for(var appendedProp:String in props)
			{
				description += appendedProp + ":" + this[appendedProp] + ", ";
			}
			
			for(var dynamicProp:String in this)
			{
				description += dynamicProp + ":" + this[dynamicProp] + ", ";
			}
			
			description += "}";
			description = description.replace(", }", "}");
			
			return description;
		}
	}
}