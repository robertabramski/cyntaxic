package com.cytaxic.cyngle
{
	public dynamic class CyntaxicVO extends Object
	{
		protected var props:Object = new Object();
		
		public function CyntaxicVO()
		{
			
		}
		
		protected function append(prop:String, value:Object):*
		{	
			props[prop] = value;
			return value;
		}
		
		public function describe():String
		{
			var description:String = "{";
		
			for(var prop:String in props)
			{
				description += prop + ":" + this[prop] + ", ";
			}
			
			description += "}";
			description = description.replace(", }", "}");
			
			return description;
		}
	}
}