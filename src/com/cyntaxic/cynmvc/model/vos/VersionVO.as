package com.cyntaxic.cynmvc.model.vos
{
	import com.cyntaxic.cynmvc.CyntaxicVO;

	/**
	 * The <code>VersionVO</code> class is a value object used to contain information framework versions.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class VersionVO extends CyntaxicVO
	{
		private var _number:String;
		private var _description:String;
		
		/**
		 * Creates a new <code>VersionVO</code> object.
		 *  
		 * @param number The version number as a string
		 * @param description The description of the release.
		 * 
		 */
		public function VersionVO(number:String, description:String)
		{
			this.number = number;
			this.description = description;
		}
		
		/**
		 * The version number as a string
		 *  
		 * @return The version number as a string
		 * 
		 */
		public function get number():String { return _number; }
		public function set number(value:String):void { _number = value; }

		/**
		 * The description of the release.
		 *  
		 * @return The description of the release.
		 * 
		 */
		public function get description():String { return _description; }
		public function set description(value:String):void { _description = value; }
	}
}