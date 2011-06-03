package
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.view.CynView;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.site.cyngleapp.controller.Controller;
	import net.site.cyngleapp.model.Model;
	import net.site.cyngleapp.view.StickiesApp;
	
	[SWF(backgroundColor="#E6E6E6")]
	
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
			// Init the framework passing in extended CynController and CynModel classes.
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