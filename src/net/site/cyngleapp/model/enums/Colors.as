package net.site.cyngleapp.model.enums
{
	public class Colors
	{
		public static const YELLOW:String = "yellow";
		public static const ORANGE:String = "orange";
		public static const LIME:String = "lime";
		public static const GREEN:String = "green";
		public static const AQUA:String = "aqua";
		public static const BLUE:String = "blue";
		public static const PURPLE:String = "purple";
		public static const VIOLET:String = "violet";
		public static const WHITE:String = "white";
		public static const GREY:String = "grey";
		
		public static var colors:Array = [YELLOW, ORANGE, LIME, GREEN, AQUA, BLUE, PURPLE, VIOLET, WHITE, GREY];
		
		public static function convertNamedColor(color:String):uint
		{
			switch(color)
			{
				case YELLOW: 	return 0xFBFF89;
				case ORANGE: 	return 0xF6AE74;
				case LIME: 		return 0xD4FF80;
				case GREEN: 	return 0xA2FF6A;
				case AQUA: 		return 0x9CF1FD;
				case BLUE: 		return 0x79ACFC;
				case PURPLE:	return 0xB38CFC;
				case VIOLET:	return 0xCC99FF;
				case WHITE:		return 0xFFFFFF;
				case GREY:		return 0xC9C9C9;
			}
			
			return null;
		}
	}
}