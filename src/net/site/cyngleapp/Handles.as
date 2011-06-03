package net.site.cyngleapp
{
	/**
	 * Handles are basically a list of all your controller functions available 
	 * to the application. The string value is extremely important as these strings are 
	 * what allows functions to be called in the controller. The string should always be
	 * exactly the same casing and name as your function in the controller. 
	 * 
	 */	
	public class Handles
	{
		public static const ADD_CONFIG_STICKIES:String = "addConfigStickies";
		public static const ADD_STICKY:String = "addSticky";
		public static const REMOVE_STICKY:String = "removeSticky";
		public static const ADD_STICKY_TO_STICKIES:String = "addStickyToStickies";
		public static const GET_STICKIES_DATA:String = "getStickiesData";
	}
}