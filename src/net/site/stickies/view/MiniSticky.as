package net.site.stickies.view
{
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.view.CynComponent;
	import com.cyntaxic.cynmvc.view.CynView;
	import com.cyntaxic.cynmvc.view.interfaces.ICynComponent;
	import com.cyntaxic.cynmvc.view.interfaces.ICynView;
	
	import flash.display.Shape;
	import flash.filters.DropShadowFilter;
	import flash.geom.ColorTransform;

	/**
	 * All views should extend either CynComposite or CynComponent. CynComposite is used for
	 * views that have other views inside of it. CynComposite has functions like add, addAt, remove
	 * and removeAt which work just like addChild and removeChild except for some added functionality
	 * for the framework. CynComponent has no CynView children and doesn't have any of the above functions.
	 * 
	 */
	public class MiniSticky extends CynComponent implements ICynView, ICynComponent
	{
		public var color:uint;
		
		private var colorTransform:ColorTransform;
		private var stickyShape:Shape;
		private var dropShadow:DropShadowFilter = new DropShadowFilter(2, 90, 0, .3, 3, 3, 1, 3);
		
		public function MiniSticky()
		{
			// CynComponent, CynComposite and CynView are abstract 
			// so this line must be added in the constructor.
			super(this);
			
			stickyShape = this.getChildAt(0) as Shape;
			
			this.filters = [dropShadow];
			this.mouseChildren = false;
			this.buttonMode = true;
		}
		
		/**
		 * The init function can be useful when extending graphics only classes. This
		 * is the base class for UIMiniSticky. UIMiniSticky can't have any params sent to its 
		 * constructor, so this is the next best thing. It returns itself for chainibility.  
		 * 
		 */	
		override public function init(vo:CyntaxicVO):CynView
		{
			this.color = vo.color;
			
			colorTransform = new ColorTransform();
			colorTransform.color = vo.color;
			stickyShape.transform.colorTransform = colorTransform;	
			
			return this;
		}
	}
}