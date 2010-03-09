package net.site.cyngleapp.controller
{
	import com.cytaxic.cyngle.CyntaxicEvent;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.controller.CynController;
	import com.cytaxic.cyngle.controller.vos.DataCallVO;
	
	import net.site.cyngleapp.Handles;
	import net.site.cyngleapp.model.Model;
	import net.site.cyngleapp.model.enums.Colors;
	import net.site.cyngleapp.model.vos.StickyVO;

	public class Controller extends CynController
	{
		private static var instance:Controller;
		
		public function Controller(key:Key)
		{
			
		}
		
		public static function getInstance():Controller
		{
			if(!instance) instance = new Controller(new Key);
			return instance;
		}
		
		public function addConfigStickies(vo:CyntaxicVO):void
		{
			var stickies:XML = new XML((vo as DataCallVO).data);
			
			for(var i:int = 0; i < stickies.sticky.length(); i++)
			{
				var id:int = i + 1;
				var message:String = stickies.sticky[i];
				var color:uint = Colors.convertNamedColor(stickies.sticky[i].@color);
				var x:Number = stickies.sticky[i].@x.valueOf();
				var y:Number = stickies.sticky[i].@y.valueOf();
				
				var sticky:StickyVO = new StickyVO(id, message, color, x, y);
				
				model.stickies.push(sticky);
				dispatchEvent(new CyntaxicEvent(Handles.ADD_STICKY, sticky)); 
			}
		}
		
		public function addSticky(vo:CyntaxicVO):void
		{
			
		}
		
		public function removeSticky(vo:CyntaxicVO):void
		{
			
		}
	}
}

internal class Key { }