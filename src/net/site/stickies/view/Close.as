package net.site.stickies.view
{
	import com.cyntaxic.cynmvc.view.CynComponent;
	import com.cyntaxic.cynmvc.view.interfaces.ICynComponent;
	import com.cyntaxic.cynmvc.view.interfaces.ICynView;
	
	import comps.close.CloseImage;
	
	import flash.display.Bitmap;

	/**
	 * All views should extend either CynComposite or CynComponent. CynComposite is used for
	 * views that have other views inside of it. CynComposite has functions like add, addAt, remove
	 * and removeAt which work just like addChild and removeChild except for some added functionality
	 * for the framework. CynComponent has no CynView children and doesn't have any of the above functions.
	 * 
	 */
	public class Close extends CynComponent implements ICynView, ICynComponent
	{
		private var close:Bitmap = new Bitmap(new CloseImage(30, 30));
		
		public function Close()
		{
			// This is a CynComponent class and has no CynView children.
			// Just adding a bitmap and calling it a day here.
			addChild(close);
		}
	}
}