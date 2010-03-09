package
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.controller.vos.DataCallVO;
	import com.cytaxic.cyngle.view.CynView;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.site.cyngleapp.controller.Controller;
	import net.site.cyngleapp.model.Model;
	
	[SWF(backgroundColor="#CCCCCC")]
	
	public class stickies extends Sprite
	{
		public function stickies()
		{
			this.loaderInfo.addEventListener(Event.COMPLETE, init);
		}
		
		private function init(event:Event):void
		{
			Cyntaxic.init(this, Model.getInstance(), Controller.getInstance());
			Cyntaxic.FULL_SCALE_FLASH = true;
			Cyntaxic.DEEP_DEBUG = true;
		}
	}
}