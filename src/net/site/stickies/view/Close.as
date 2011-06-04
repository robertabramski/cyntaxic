package net.site.stickies.view
{
	import com.cyntaxic.cyngle.view.CynComponent;
	import com.cyntaxic.cyngle.view.interfaces.ICynComponent;
	import com.cyntaxic.cyngle.view.interfaces.ICynView;
	
	import comps.close.CloseImage;
	
	import flash.display.Bitmap;

	public class Close extends CynComponent implements ICynView, ICynComponent
	{
		private var close:Bitmap = new Bitmap(new CloseImage(30, 30));
		
		public function Close()
		{
			addChild(close);
		}
	}
}