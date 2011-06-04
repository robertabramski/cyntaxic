package net.site.stickies.view
{
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.view.CynView;
	import com.cyntaxic.cynmvc.view.interfaces.ICynComponent;
	import com.cyntaxic.cynmvc.view.interfaces.ICynView;
	
	import flash.display.Shape;
	import flash.filters.DropShadowFilter;
	import flash.geom.ColorTransform;
	
	import net.site.stickies.model.enums.Colors;
	import net.site.stickies.model.vos.StickyVO;

	public class MiniSticky extends CynView implements ICynView, ICynComponent
	{
		public var color:uint;
		
		private var colorTransform:ColorTransform;
		private var stickyShape:Shape;
		private var dropShadow:DropShadowFilter = new DropShadowFilter(2, 90, 0, .3, 3, 3, 1, 3);
		
		public function MiniSticky()
		{
			stickyShape = this.getChildAt(0) as Shape;
			
			this.filters = [dropShadow];
			this.mouseChildren = false;
			this.buttonMode = true;
		}
		
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