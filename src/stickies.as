package
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.CyntaxicVO;
	import com.cyntaxic.cyngle.view.CynView;
	import com.cyntaxic.cyntils.CynFormat;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.site.cyngleapp.controller.Controller;
	import net.site.cyngleapp.model.Model;
	import net.site.cyngleapp.view.StickiesApp;
	
	[SWF(backgroundColor="#E6E6E6")]
	
	public class stickies extends Sprite
	{
		private var app:CynView;
		
		public function stickies()
		{
			this.loaderInfo.addEventListener(Event.COMPLETE, init);
		}
		
		private function init(event:Event):void
		{
			Cyntaxic.init(this, Model.getInstance(), Controller.getInstance(), false);
			Cyntaxic.FULL_SCALE_FLASH = true;
			Cyntaxic.DEEP_DEBUG = false;
			
			var config:CyntaxicVO = new CyntaxicVO(Cyntaxic.FLASH_VARS);
			
			app = new StickiesApp().init(config);
			addChild(app);
			
			//CynValidate.passFail = true;
			//trace(CynValidate.socialSecurity("146-72-5680"));
			
			trace(CynFormat.cash(1046652, "$", true, "."));
			trace(CynFormat.decimalNumber(1000622, 5));
		}
	}
}