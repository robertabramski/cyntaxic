package net.site.cyngleapp.view
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.view.CynComposite;
	import com.cyntaxic.cyngle.view.interfaces.ICynComposite;
	import com.cyntaxic.cyngle.view.interfaces.ICynView;
	
	import flash.display.MovieClip;

	public class StickyHeader extends CynComposite implements ICynComposite, ICynView
	{
		private var back:MovieClip;
		private var title:MovieClip;
		
		public function StickyHeader()
		{
			title = getChildByName("title") as MovieClip;
			back = getChildByName("back") as MovieClip;
			
			resize();
		}
		
		override public function resize():void
		{
			back.width = Cyntaxic.STAGE.stageWidth;
			
			if(Cyntaxic.STAGE.stageWidth < 450) title.visible = false;
			else title.visible = true;
		}
	}
}