package net.site.cyngleapp.view
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.CyntaxicVO;
	import com.cyntaxic.cyngle.controller.helpers.DataCall;
	import com.cyntaxic.cyngle.controller.helpers.DataCallEvent;
	import com.cyntaxic.cyngle.view.CynComposite;
	import com.cyntaxic.cyngle.view.CynView;
	import com.cyntaxic.cyngle.view.interfaces.ICynComposite;
	import com.cyntaxic.cyngle.view.interfaces.ICynView;
	
	import comps.header.UIStickyHeader;
	import comps.sticky.UISticky;
	
	import net.site.cyngleapp.Handles;
	import net.site.cyngleapp.controller.Controller;
	import net.site.cyngleapp.model.Model;
	import net.site.cyngleapp.model.vos.StickyVO;
	
	/**
	 * All views should extend either CynComposite or CynComponent. CynComposite is used for
	 * views that have other views inside of it. CynComposite has functions like add, addAt, remove
	 * and removeAt which work just like addChild and removeChild except for some added functionality
	 * for the framework.
	 * 
	 */	
	public class StickiesApp extends CynComposite implements ICynComposite, ICynView
	{
		private var model:Model;
		private var controller:Controller;
		private var margin:Number = 10;
		private var header:UIStickyHeader = new UIStickyHeader();
		private var stickySpawn:StickySpawn = new StickySpawn();
		private var call:DataCall;
				
		public function StickiesApp()
		{
			// Cast model and controller for your application.
			model = (cynModel as Model);
			controller = (cynController as Controller);
			
			// Add views with CynComposite add function.
			add(header);
			add(stickySpawn);
			  
			resize(null);
		}
		
		override public function init(vo:CyntaxicVO):CynView
		{
			debug("Received FlashVars: " + vo.describe());
			
			call = new DataCall(vo.config);
			call.addEventListener(DataCallEvent.COMPLETE, addConfigStickies);
			debug('DataCall for "' + vo.config + '".');
			
			return this;
		}
		
		private function addConfigStickies(event:DataCallEvent):void
		{
			call.removeEventListener(DataCallEvent.COMPLETE, addConfigStickies);
			
			debug('Loaded "' + event.data.url + '": ' + event.data.describe());
			debug('Execute command ' + Handles.ADD_CONFIG_STICKIES + ' in controller.');
			
			// Data is loaded. Send to controller to process. Handle matches function name in controller.
			controller.execute(Handles.ADD_CONFIG_STICKIES, event.data);
		}
		
		public function addSticky(vo:StickyVO):void
		{
			var sticky:CynView = new UISticky().init(vo);
			
			debug('Added sticky #' + vo.id + ' to view.');
			
			// Add the child and use the props param to position on add.
			add(sticky, {x:vo.x, y:vo.y});
			
			// Add to the sticky array. Handle matches function name in controller.
			controller.execute(Handles.ADD_STICKY_TO_STICKIES, new CyntaxicVO({sticky:sticky}));
		}
		
		public function removeSticky(vo:CyntaxicVO):void
		{
			debug('Removed and deleted sticky #' + vo.sticky.id + ' from view.');
			
			// Remove will just remove from display list unless the completely flag is set.
			// This will do the same as destroy() which removes all reference and sets it to null.
			remove(vo.sticky as Sticky, true);
		}
		
		/**
		 * The resize function is overridden from CynView. This works in conjunction with
		 * the Cyntaxic.fullScaleFlash option which sets up the application for liquid layout.
		 * 
		 */
		override public function resize(vo:CyntaxicVO):void
		{
			// The static Cyntaxic.STAGE property allows access to stage properties anywhere.
			stickySpawn.x = Cyntaxic.STAGE.stageWidth - stickySpawn.width - margin;
			stickySpawn.y = margin;
		}
	}
}


