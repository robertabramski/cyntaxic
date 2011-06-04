package net.site.stickies.view
{
	import com.cyntaxic.cynmvc.Cyntaxic;
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.view.CynComposite;
	import com.cyntaxic.cynmvc.view.interfaces.ICynComposite;
	import com.cyntaxic.cynmvc.view.interfaces.ICynView;
	
	import flash.display.MovieClip;

	public class StickyHeader extends CynComposite implements ICynComposite, ICynView
	{
		private var back:MovieClip;
		private var title:MovieClip;
		
		public function StickyHeader()
		{
			title = getChildByName("title") as MovieClip;
			back = getChildByName("back") as MovieClip;
			
			resize(null);
		}
		
		override public function resize(vo:CyntaxicVO):void
		{
			back.width = Cyntaxic.STAGE.stageWidth;
			
			if(Cyntaxic.STAGE.stageWidth < 450) title.visible = false;
			else title.visible = true;
		}
	}
}