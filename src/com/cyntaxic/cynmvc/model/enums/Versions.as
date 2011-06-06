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
		 * Release 1.0.0 of the framework. 
		 */
		public static const VERSION_1_0_0:VersionVO = new VersionVO("1.0.0", "Initial public release");
		
		/**
		 * Release 0.1.1 of the framework. 
		 */
		public static const VERSION_0_1_1:VersionVO = new VersionVO("0.1.1", "Documentation fixes and demo fixes.");
		
		/**
		 * Release 0.1.0 of the framework. 
		 */
		public static const VERSION_0_1_0:VersionVO = new VersionVO("0.1.0", "Documentation and framework completed.");
	}
}