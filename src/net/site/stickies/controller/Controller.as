package net.site.stickies.controller
{
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.controller.CynController;
	import com.cyntaxic.cynmvc.model.helpers.DataCall;
	import com.cyntaxic.cynmvc.model.helpers.DataCallEvent;
	import com.cyntaxic.cynmvc.model.vos.DataCallVO;
	
	import flash.geom.Point;
	
	import net.site.stickies.Handles;
	import net.site.stickies.model.Model;
	import net.site.stickies.model.enums.Colors;
	import net.site.stickies.model.vos.StickyVO;
	import net.site.stickies.view.Sticky;

	/**
	 * This is the application's Controller class. It must extend CynController and
	 * be passed in the Cyntaxic.init function to use the framework. Here is where all
	 * the logic for the application is processed.
	 * 
	 */
	public class Controller extends CynController
	{
		private static var instance:Controller;
		
		private var model:Model;
		
		public function Controller(key:Key)
		{
			// As CynController is an abstract class and Actionscript doesn't support
			// abstract classes this line of code is used for enforcement.
			super(this);
		}
		
		public static function getInstance():Controller
		{
			// ActionScript also doesn't have private constructors, so this used to 
			// enforce singleton usage of the Controller class.
			if(!instance) instance = new Controller(new Key);
			return instance;
		}
		
		public function getStickiesData(vo:CyntaxicVO):void
		{
			// Cast the cynModel to the extended model class.
			model = (cynModel as Model);
			
			// In case config var wasn't set, start without stickies. 
			if(!vo.config) { model.id = 1; return; }
			
			// Use CynModel get or post functions to make data calls to external resource.
			// This call returns a DataCallVO with a result property.
			debug('DataCall for "' + vo.config + '".');
			model.get(Handles.ADD_CONFIG_STICKIES, vo.config);
		}
		
		public function addConfigStickies(vo:DataCallVO):void
		{
			// DataCallVO has result property to check success or failure.
			if(vo.result == DataCall.COMPLETE)
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
			}
			else if(vo.result == DataCall.IO_ERROR || vo.result == DataCall.TIMEOUT)
			{
				var oopsSticky:CyntaxicVO; 
				var errorSticky:CyntaxicVO; 
				
				// An error was found. Handle with error stickies.
				oopsSticky = new StickyVO(1, "Looks like something went wrong. See below:", Colors.convertNamedColor(Colors.YELLOW), 36, 68);
				errorSticky = new StickyVO(2, vo.data.toString(), Colors.convertNamedColor(Colors.AQUA), 88, 130);
				
				debug("Dispatched " + Handles.ADD_STICKY + " to views.");
				
				// Add the error stickies.
				notify(Handles.ADD_STICKY, oopsSticky);
				notify(Handles.ADD_STICKY, errorSticky);
			}
		}
		
		public function addSticky(vo:CyntaxicVO):void
		{
			// In case model wasn't set yet, set it.
			if(!model) { model = (cynModel as Model); model.id = 1; }
			
			var offset:Number = model.stickyOffset;
			var point:Point = model.currentSticky ? new Point(model.currentSticky.x + offset, model.currentSticky.y + offset) : new Point(100, 100);
			var sticky:StickyVO = new StickyVO(model.id++, "", vo.color, point.x, point.y);
			
			debug("Dispatched " + Handles.ADD_STICKY + " to views.");
			
			// Notify views of addSticky. Any function named addSticky in a view 
			// publicly will respond to this notify function.
			notify(Handles.ADD_STICKY, sticky);
		}
		
		public function addStickyToStickies(vo:CyntaxicVO):void
		{
			var sticky:Sticky = vo.sticky as Sticky;
			
			// Update the model after view has added sticky. 
			model.stickies.push(sticky);
			model.currentSticky = sticky;
			model.id = sticky.id;
			
			debug("Added sticky #" + sticky.id + " to model.stickies.");
		}
		
		public function removeSticky(vo:CyntaxicVO):void
		{
			var sticky:Sticky = vo.sticky as Sticky;
			
			for(var i:int = 0; i < model.stickies.length; i++)
			{
				if(model.stickies[i].id == sticky.id)
				{
					// Remove from the stickies array.
					model.stickies.splice(i, 1);
					debug("Removed sticky #" + sticky.id + " from model.stickies.");
				}
			}
			
			debug("Dispatched " + Handles.REMOVE_STICKY + " to views.");
			
			// Remove the sticky from the view.
			notify(Handles.REMOVE_STICKY, new CyntaxicVO({sticky:vo.sticky}));
		}
	}
}

// Internal key for singleton.
internal class Key { }


