package net.site.stickies.controller
{
	import com.cyntaxic.cynmvc.CyntaxicEvent;
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.controller.CynController;
	import com.cyntaxic.cynmvc.model.vos.DataCallVO;
	
	import flash.geom.Point;
	
	import net.site.stickies.Handles;
	import net.site.stickies.model.Model;
	import net.site.stickies.model.enums.Colors;
	import net.site.stickies.model.vos.StickyVO;
	import net.site.stickies.view.Sticky;
	import net.site.stickies.view.StickyHeader;

	public class Controller extends CynController
	{
		private static var instance:Controller;
		
		private var model:Model;
		
		public function Controller(key:Key)
		{
			super(this);
		}
		
		public static function getInstance():Controller
		{
			if(!instance) instance = new Controller(new Key);
			return instance;
		}
		
		public function addConfigStickies(vo:DataCallVO):void
		{
			// After model.get has gotten the data, cast it as XML.
			var stickies:XML = new XML(vo.data);
			
			// Process the returned XML.
			for(var i:int = 0; i < stickies.sticky.length(); i++)
			{
				var id:int = i + 1;
				var message:String = stickies.sticky[i];
				var color:uint = Colors.convertNamedColor(stickies.sticky[i].@color);
				var x:Number = stickies.sticky[i].@x.valueOf();
				var y:Number = stickies.sticky[i].@y.valueOf();
				var sticky:CyntaxicVO = new StickyVO(id, message, color, x, y);
				
				debug("Dispatched " + Handles.ADD_STICKY + " to views.");
				
				//Add each sticky to view.
				notify(Handles.ADD_STICKY, sticky);
			}
			
			model.id = i + 1;
			model.currentSticky = model.stickies[i - 1];
		}
		
		public function getStickiesData(vo:CyntaxicVO):void
		{
			model = (cynModel as Model);
			
			// Use CynModel get or post functions to make data calls to external resource.
			debug('DataCall for "' + vo.config + '".');
			model.get(Handles.ADD_CONFIG_STICKIES, vo.config);
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


