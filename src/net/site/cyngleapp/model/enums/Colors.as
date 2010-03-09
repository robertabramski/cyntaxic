package net.site.cyngleapp.model.enums
{
	public class Colors
	{
		public static const RED:String = "red";
		public static const GREEN:String = "green";
		public static const BLUE:String = "blue";
		
		public static function convertNamedColor(color:String):uint
		{
			switch(color)
			{
				case RED: return 0xFF0000;
				case GREEN: return 0x00FF00;
				case BLUE: return 0x0000FF;
			}
			
			return null;
		}
	}
}