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
	import net.site.cyngleapp.view.StickyHeader;

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
				
				debug("Dispatched " + Handles.ADD_STICKY + " to views.");
				notify(Handles.ADD_STICKY, sticky);
			}
			
			model.id = i + 1;
			model.currentSticky = model.stickies[i - 1];
		}
		
		public function addSticky(vo:CyntaxicVO):void
		{
			if(!model)
			{
				model = (cynModel as Model);
				model.id = 1;
			}
			
			var offset:Number = model.stickyOffset;
			var point:Point = model.currentSticky ? new Point(model.currentSticky.x + offset, model.currentSticky.y + offset) : new Point(100, 100);
			var sticky:StickyVO = new StickyVO(model.id++, "", vo.color, point.x, point.y);
			
			debug("Dispatched " + Handles.ADD_STICKY + " to views.");
			notify(Handles.ADD_STICKY, sticky);
		}
		
		public function addStickyToStickies(vo:CyntaxicVO):void
		{
			var sticky:Sticky = vo.sticky as Sticky;
			
			model.stickies.push(sticky);
			model.currentSticky = sticky;
			
			debug("Added sticky #" + sticky.id + " to model.stickies.");
		}
		
		public function removeSticky(vo:CyntaxicVO):void
		{
			var sticky:Sticky = vo.sticky as Sticky;
			
			for(var i:int = 0; i < model.stickies.length; i++)
			{
				if(model.stickies[i].id == sticky.id)
				{
					model.stickies.splice(i, 1);
					debug("Removed sticky #" + sticky.id + " from model.stickies.");
				}
			}
			
			debug("Dispatched " + Handles.REMOVE_STICKY + " to views.");
			notify(Handles.REMOVE_STICKY, new CyntaxicVO({sticky:vo.sticky}));
		}
	}
}

internal class Key { }


