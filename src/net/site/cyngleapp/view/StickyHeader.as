package net.site.cyngleapp.view
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.view.CynComposite;
	import com.cytaxic.cyngle.view.interfaces.ICynComposite;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
	import flash.display.MovieClip;

	public class StickyHeader extends CynComposite implements ICynComposite, ICynView
	{
		private var back:MovieClip;
		
		public function StickyHeader()
		{
			back = getChildByName("back") as MovieClip;
			resize();
		}
		
		override public function resize():void
		{
			back.width = Cyntaxic.STAGE.stageWidth;
		}
	}
}