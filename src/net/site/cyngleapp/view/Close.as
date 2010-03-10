package net.site.cyngleapp.view
{
	import com.cytaxic.cyngle.view.CynComponent;
	import com.cytaxic.cyngle.view.interfaces.ICynComponent;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
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