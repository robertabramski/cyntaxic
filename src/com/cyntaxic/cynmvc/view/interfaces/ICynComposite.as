package com.cyntaxic.cynmvc.view.interfaces
{
	import com.cyntaxic.cynmvc.view.CynView;
	
	/**
	 * This interface is used to define a <code>CynView</code> object that has
	 * children that are views.
	 *  
	 * @author robertabramski
	 * 
	 */
	public interface ICynComposite
	{
		/**
		 * Adds a <code>CynView</code> to the display list. An optional set of properties 
		 * can be sent to the object at time of addition. These property names
		 * match the properties of other display objects.
		 *  
		 * @param view The view to be added to the display list.
		 * @param props An object with display object properties.
		 * @return The view that was added.
		 * 
		 */
		function add(child:CynView, props:Object = null):CynView
			
		/**
		 * Adds a <code>CynView</code> to the display list at the specified index. 
		 * An optional set of properties can be sent to the object at time of addition. 
		 * These property names match the properties of other display objects.
		 * 
		 * @param view The view to be added to the display list.
		 * @param index The index to add the object at.
		 * @param props An object with display object properties.
		 * @return The view that was added.
		 * 
		 */
		function addAt(child:CynView, index:int, props:Object = null):CynView
			
		/**
		 * Removes a <code>CynView</code> from the display list. When the completely flag 
		 * is set the function completely destroys all reference and nulls out the object as
		 * well as its children.
		 *  
		 * @param view The view to be removed from the display list.
		 * @param completely Flag set to determine if it is removed or destroyed completely. 
		 * @return The view that has been removed.
		 * 
		 * @see #destroy()
		 * 
		 */
		function remove(child:CynView, completely:Boolean = false):CynView
			
		/**
		 * Removes a <code>CynView</code> from the display list at the specified index. When the 
		 * completely flag is set the function completely destroys all reference and nulls out the 
		 * object as well as its children.
		 *  
		 * @param index The index at which to remove the view.
		 * @param completely Flag set to determine if it is removed or destroyed completely.
		 * @return The view that has been removed.
		 * 
		 * @throws CynError If object at index is not a <code>CynView</code>.
		 * 
		 */
		function removeAt(index:int, completely:Boolean = false):CynView
			
		/**
		 * Destroys a <code>CynView</code> from the display list. All reference is destroyed 
		 * and the object is nulled out the object as well as its children.
		 *  
		 * @param view The view to be destroyed.
		 * 
		 */
		function destroy(view:CynView):void
		
		/**
		 * Destroys a <code>CynView</code> from the display list  at the specified index. 
		 * All reference is destroyed and the object is nulled out the object as well as its children.
		 *  
		 * @param index The index at which to destroy the view.
		 * 
		 * @throws CynError If object at index is not a <code>CynView</code>. 
		 * 
		 */
		function destroyAt(index:int):void
	}
}