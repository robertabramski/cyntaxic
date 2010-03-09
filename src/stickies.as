package
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.view.CynView;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.site.cyngleapp.controller.Controller;
	import net.site.cyngleapp.model.Model;
	import net.site.cyngleapp.view.StickiesApp;
	
	[SWF(backgroundColor="#CCCCCC")]
	
	public class stickies extends Sprite
	{
		private var app:CynView;
		
		public function stickies()
		{
			this.loaderInfo.addEventListener(Event.COMPLETE, init);
		}
		
		private function init(event:Event):void
		{
			Cyntaxic.init(this, Model.getInstance(), Controller.getInstance());
			Cyntaxic.FULL_SCALE_FLASH = true;
			Cyntaxic.DEEP_DEBUG = true;
			
			var config:CyntaxicVO = new CyntaxicVO(Cyntaxic.FLASH_VARS);
			
			app = new StickiesApp().init(config);
			addChild(app);
		}
	}
}