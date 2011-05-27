package
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.CyntaxicVO;
	import com.cyntaxic.cyngle.view.CynView;
	import com.cyntaxic.cyntils.CynFormat;
	import com.cyntaxic.cyntils.CynString;
	import com.cyntaxic.cyntils.CynValidate;
	
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
			Cyntaxic.init(this, Model.getInstance(), Controller.getInstance(), 
			{
				debug:true,
				fullScaleFlash:true
			});
			
			app = new StickiesApp().init(Cyntaxic.FLASH_VARS_VO);
			addChild(app);
		}
	}
}