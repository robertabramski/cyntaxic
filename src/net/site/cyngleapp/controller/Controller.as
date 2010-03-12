package net.site.cyngleapp.controller
{
	import com.cyntaxic.cyngle.CyntaxicEvent;
	import com.cyntaxic.cyngle.CyntaxicVO;
	import com.cyntaxic.cyngle.controller.CynController;
	import com.cyntaxic.cyngle.controller.vos.DataCallVO;
	
	import flash.geom.Point;
	
	import net.site.cyngleapp.Handles;
	import net.site.cyngleapp.model.Model;
	import net.site.cyngleapp.model.enums.Colors;
	import net.site.cyngleapp.model.vos.StickyVO;
	import net.site.cyngleapp.view.Sticky;

	public class Controller extends CynController
	{
		private static var instance:Controller;
		
		private var model:Model;
		
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
			model = (cynModel as Model);
			
			var stickies:XML = new XML((vo as DataCallVO).data);
			
			for(var i:int = 0; i < stickies.sticky.length(); i++)
			{
				var id:int = i + 1;
				var message:String = stickies.sticky[i];
				var color:uint = Colors.convertNamedColor(stickies.sticky[i].@color);
				var x:Number = stickies.sticky[i].@x.valueOf();
				var y:Number = stickies.sticky[i].@y.valueOf();
				var sticky:CyntaxicVO = new StickyVO(id, message, color, x, y);
				
				dispatchEvent(new CyntaxicEvent(Handles.ADD_STICKY, sticky)); 
			}
			
			model.id = i;
			model.currentSticky = model.stickies[i - 1];
		}
		
		public function addSticky(vo:CyntaxicVO):void
		{
			var offset:Number = model.stickyOffset;
			var point:Point = new Point(model.currentSticky.x + offset, model.currentSticky.y + offset);
			var sticky:StickyVO = new StickyVO(model.id++, "", vo.color, point.x, point.y);
			
			dispatchEvent(new CyntaxicEvent(Handles.ADD_STICKY, sticky));
		}
		
		public function removeSticky(vo:CyntaxicVO):void
		{
			dispatchEvent(new CyntaxicEvent(Handles.REMOVE_STICKY, new CyntaxicVO({sticky:vo.sticky})));
		}
	}
}

internal class Key { }


