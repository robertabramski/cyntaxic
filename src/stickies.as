package
{
	import com.cytaxic.cyngle.Cyntaxic;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.site.cyngleapp.controller.Controller;
	import net.site.cyngleapp.model.Model;
	import net.site.cyngleapp.view.StickiesApp;
	
	[SWF(backgroundColor="#CCCCCC")]
	
	public class stickies extends Sprite
	{
		private var app:StickiesApp;
		
		public function stickies()
		{
			this.loaderInfo.addEventListener(Event.COMPLETE, init);
		}
		
		private function init(event:Event):void
		{
			Cyntaxic.init(this, Model.getInstance(), Controller.getInstance());
			Cyntaxic.FULL_SCALE_FLASH = true;
			Cyntaxic.DEEP_DEBUG = true;
			
			app = new StickiesApp();
			addChild(app);
		}
	}
}