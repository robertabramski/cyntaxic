package
{
	import com.cyntaxic.cynmvc.Cyntaxic;
	import com.cyntaxic.cynmvc.view.CynView;
	import com.cyntaxic.cyntils.CynBrowser;
	import com.cyntaxic.cyntils.CynNumber;
	import com.cyntaxic.cyntils.CynRandom;
	import com.cyntaxic.cyntils.CynString;
	import com.cyntaxic.cyntils.CynValidate;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.site.stickies.controller.Controller;
	import net.site.stickies.model.Model;
	import net.site.stickies.view.StickiesApp;
	
	[SWF(backgroundColor="#E6E6E6", pageTitle="Cyntaxic | Stickies Demo")]
	
	/**
	 * The document class for the Stickies demo app.
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
				debug:true, 			// Sets the debugger on or off. Default is true.
				deepDescribe:false, 	// Allows for flash.* properties to be described. Default is false. 
				fullScaleFlash:true,	// Sets application up for liquid layout. Default is false.
				cmLove:true				// Adds framework love link to the root contextual menu. Default is true.  
			});
			
			trace(CynString.trim("This is my trim test\s") + 'ass');
			
			// Add the application class and init. Add to display as CynView.
			app = addChild(new StickiesApp().init(Cyntaxic.FLASH_VARS_VO)) as CynView;
		}
	}
}