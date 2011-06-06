package com.cyntaxic.cyntils
{
	/**
	 * The <code>CynColor</code> class contains static functions for 
	 * manipulation of colors.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class CynColor
	{
		/**
		 * Converts a hexidecmal string into an unsigned integer. This does the 
		 * opposite of <code>uint2hex</code>. 
		 * 
		 * @param hex The hexidecmal string to convert.
		 * 
		 * @see #uint2hex()
		 * @return An unsigned integer with a equivalent value to the hex. 
		 * 
		 */
		public static function hex2uint(hex:String):uint
		{
			return uint("0x" + hex.split("#")[1]);
		}
		
		/**
		 * Converts an unsigned integer into an hexidecmal string. This does the 
		 * opposite of <code>hex2uint</code>. 
		 * 
		 * @param num The unsigned integer to convert.
		 * 
		 * @see #hex2uint()
		 * @return A hex string with a equivalent value to the uint.
		 * 
		 */
		public static function uint2hex(num:uint):String
		{
			return String("#" + (num.toString(16).toUpperCase()));
		}
		
		/**
		 * Converts RGB values into an unsigned integer.
		 *  
		 * @param r The red value as an integer.
		 * @param g The green value as an integer.
		 * @param b The blue value as an integer.
		 * 
		 * @return An unsigned integer with a equivalent value to the RGB values passed. 
		 * 
		 */
		public static function rgb2uint(r:int, g:int, b:int):uint
		{
			return (r << 16 | g << 8 | b);
		}
		
		/**
		 * Converts HSV values to an unsigned integer.
		 *  
		 * @param hue The hue value.
		 * @param sat The saturation value.
		 * @param val The value value. This also sometimes referred to as brightness.
		 * 
		 * @return An unsigned integer with a equivalent value to the HSV values passed. 
		 * 
		 */
		public static function hsv2uint(hue:Number, sat:Number, val:Number):uint
		{
			var obj:Object = hsv2rgb(hue, sat, val);
			return (obj.r << 16 | obj.g << 8 | obj.b);
		}
		
		/**
		 * Converts HSV values to RGB values. This does the opposite 
		 * of <code>rgb2hsv</code>. 
		 * 
		 * @param hue The hue value.
		 * @param sat The saturation value.
		 * @param val The brightness value. This also sometimes referred to as value.
		 * 
		 * @see #rgb2hsv()
		 * @return An object containing the properties r for red, g for green and b for blue.
		 * 
		 */
		public static function hsv2rgb(hue:Number, sat:Number, val:Number):Object
		{
			var red:Number, grn:Number, blu:Number;
			var i:Number, f:Number, p:Number, q:Number, t:Number;
			
			hue %= 360;
			
			if(val == 0) return {r:0, g:0, b:0};
			
			sat /= 100;
			val /= 100;
			hue /= 60;
			
			i = Math.floor(hue);
			f = hue - i;
			p = val * (1 - sat);
			q = val * (1 - (sat * f));
			t = val * (1 - (sat * (1 - f)));
			
			if(i == 0) { red = val; grn = t; blu = p; }
			else if(i == 1)	{ red = q; grn = val; blu = p; }
			else if(i == 2)	{ red = p; grn = val; blu = t; }
			else if(i == 3)	{ red = p; grn = q; blu = val; }
			else if(i == 4)	{ red = t; grn = p; blu = val; }
			else if(i == 5)	{ red = val; grn = p; blu = q; }
			
			red = Math.floor(red * 255);
			grn = Math.floor(grn * 255);
			blu = Math.floor(blu * 255);
			
			return {r:red, g:grn, b:blu};
		}
		
		/**
		 * Converts RGB values to HSV values. This does the opposite 
		 * of <code>hsv2rgb</code>. 
		 *  
		 * @param red The red value.
		 * @param grn The green value.
		 * @param blu The blue value.
		 * 
		 * @see #hsv2rgb()
		 * @return An object containing the properties h for hue, s for saturation and v for value.
		 * 
		 */
		public static function rgb2hsv(red:Number, grn:Number, blu:Number):Object
		{
			var x:Number, f:Number, i:Number, hue:Number, sat:Number, val:Number;
			
			red /= 255;
			grn /= 255;
			blu /= 255;
			
			x = Math.min(Math.min(red, grn), blu);
			val = Math.max(Math.max(red, grn), blu);
			
			if (x == val) return {h:undefined, s:0, v:val * 100};
			
			f = (red == x) ? grn - blu : ((grn == x) ? blu - red : red - grn);
			i = (red == x) ? 3 : ((grn == x) ? 5 : 1);
			
			hue = Math.floor((i - f/(val - x)) * 60) % 360;
			sat = Math.floor(((val - x)/val) * 100);
			val = Math.floor(val * 100);
			
			return {h:hue, s:sat, v:val};
		}
	}
}