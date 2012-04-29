package com.cyntaxic.cynmvc.model.vos
{
	import com.cyntaxic.cynmvc.CyntaxicVO;
	
	/**
	 * The <code>ScopeVO</code> class is a value object used to scope a model callback.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class ScopeVO extends CyntaxicVO
	{
		private var _scope:Object;
		private var _handle:String;
		
		/**
		 * Creates a new scoped value object.
		 *  
		 * @param scope The object to call the handle on.
		 * @param handle The handle string to call.
		 * 
		 */		
		public function ScopeVO(scope:Object, handle:String)
		{
			_scope = scope;
			_handle = handle;
		}
		
		/**
		 * The object that is being called on. 
		 * 
		 * @return The scoped object. 
		 * 
		 */		
		public function get scope():Object { return _scope; }
		
		/**
		 * The handle string to be called on the scoped object.
		 *  
		 * @return The handle string.
		 * 
		 */		
		public function get handle():String { return _handle; }
	}
}