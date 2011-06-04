package net.site.stickies.view
{
	import com.cyntaxic.cynmvc.Cyntaxic;
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.view.CynComposite;
	import com.cyntaxic.cynmvc.view.interfaces.ICynComposite;
	import com.cyntaxic.cynmvc.view.interfaces.ICynView;
	
	import flash.display.MovieClip;
	
	/**
	 * All views should extend either CynComposite or CynComponent. CynComposite is used for
	 * views that have other views inside of it. CynComposite has functions like add, addAt, remove
	 * and removeAt which work just like addChild and removeChild except for some added functionality
	 * for the framework. CynComponent has no CynView children and doesn't have any of the above functions.
	 * 
	 */
	public class StickyHeader extends CynComposite implements ICynComposite, ICynView
	{
		private var back:MovieClip;
		private var title:MovieClip;
		
		public function StickyHeader()
		{
			// Get children in graphic and assign to a variable.
			title = getChildByName("title") as MovieClip;
			back = getChildByName("back") as MovieClip;
			
			resize(null);
		}
		
		/**
		 * The resize function is overridden from CynView. This works in conjunction with
		 * the Cyntaxic.fullScaleFlash option which sets up the application for liquid layout.
		 * 
		 */
		override public function resize(vo:CyntaxicVO):void
		{
			// The static Cyntaxic.STAGE property allows access to stage properties anywhere.
			back.width = Cyntaxic.STAGE.stageWidth;
			
			if(Cyntaxic.STAGE.stageWidth < 450) title.visible = false;
			else title.visible = true;
		}
	}
}