package
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.controller.vos.DataCallVO;
	import com.cytaxic.cyngle.view.CynView;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.site.cyngleapp.controller.Controller;
	import net.site.cyngleapp.model.Model;
	import net.site.cyngleapp.view.Box;
	
	[SWF(backgroundColor="#CCCCCC")]
	
	public class testapp extends Sprite
	{
		public function testapp()
		{
			this.loaderInfo.addEventListener(Event.COMPLETE, init);
		}
		
		private function init(event:Event):void
		{
			Cyntaxic.init(this, Model.getInstance(), Controller.getInstance());
			Cyntaxic.FULL_SCALE_FLASH = true;
			Cyntaxic.DEEP_DEBUG = true;
			
			var vo:DataCallVO = new DataCallVO("http://www.apple.com");
			
			var box:CynView = new Box().init(vo);
			addChild(box);
			box.x = box.y = 10;
		}
	}
}