package com.cyntaxic.cynmvc.model.enums
{
	import com.cyntaxic.cynmvc.model.vos.VersionVO;
	
	/**
	 * The <code>Versions</code> class is an enumeration of framework releases.
	 *  
	 * @author robertabramski
	 * 
	 */	
	public class Versions
	{
		/**
		 * Release 0.1.2 of the framework. 
		 */
		public static const VERSION_0_1_2:VersionVO = new VersionVO("0.1.2", "Documentation fixes and added some suggestions by Markus Winkler. Added destroySelf and removeSelf functions.");
		
		/**
		 * Release 0.1.1 of the framework. 
		 */
		public static const VERSION_0_1_1:VersionVO = new VersionVO("0.1.1", "Documentation fixes, demo fixes, Flex support and demo.");
		
		/**
		 * Release 0.1.0 of the framework. 
		 */
		public static const VERSION_0_1_0:VersionVO = new VersionVO("0.1.0", "Documentation and framework completed.");
	}
}