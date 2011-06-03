package
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.view.CynView;
	import com.cyntaxic.cyntils.CynBrowser;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.site.cyngleapp.controller.Controller;
	import net.site.cyngleapp.model.Model;
	import net.site.cyngleapp.view.StickiesApp;
	
	[SWF(backgroundColor="#E6E6E6", pageTitle="Cyntaxic Framework Demo | Stickies")]
	
	/**
	 * The document class for the Stickies example app.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class stickies extends Sprite
	{
		private var app:CynView;
		
		public function stickies()
		{
			// Initialize the framework after loaderInfo is available.
			this.loaderInfo.addEventListener(Event.COMPLETE, init);
		}
		
		private function init(event:Event):void
		{
			// Init the framework passing in the document class and extended CynController and CynModel classes.
			// A props object can also be passed at initialization as a final parameter.
			Cyntaxic.init(this, Model.getInstance(), Controller.getInstance(), 
			{
				debug:true,
				deepDescribe:false,
				fullScaleFlash:true
			});
			
			// Add the application class and init. Add to display as CynView.
			app = addChild(new StickiesApp().init(Cyntaxic.FLASH_VARS_VO)) as CynView;
		}
	}
}