package net.site.stickies.view
{
	import com.cyntaxic.cynmvc.CyntaxicVO;
	import com.cyntaxic.cynmvc.view.CynComposite;
	import com.cyntaxic.cynmvc.view.interfaces.ICynComposite;
	import com.cyntaxic.cynmvc.view.interfaces.ICynView;
	
	import comps.sticky.UIMiniSticky;
	
	import flash.events.MouseEvent;
	
	import net.site.stickies.Handles;
	import net.site.stickies.controller.Controller;
	import net.site.stickies.model.Model;
	import net.site.stickies.model.enums.Colors;

	/**
	 * All views should extend either CynComposite or CynComponent. CynComposite is used for
	 * views that have other views inside of it. CynComposite has functions like add, addAt, remove
	 * and removeAt which work just like addChild and removeChild except for some added functionality
	 * for the framework.
	 * 
	 */	
	public class StickySpawn extends CynComposite implements ICynView, ICynComposite
	{
		private var model:Model;
		private var controller:Controller;
		private var margin:Number = 8;
		
		public function StickySpawn()
		{
			model = (cynModel as Model);
			controller = (cynController as Controller);
			
			for(var i:int = 0; i < model.colors.length; i++)
			{
				// UIMiniSticky is a graphic in assets/stickies.swc. It extends the 
				// MiniSticky class for its logic.
				var miniSticky:UIMiniSticky = new UIMiniSticky();
				var color:Object = {color:Colors.convertNamedColor(model.colors[i])};
				
				// The init function is useful when instantiating graphics only classes where 
				// there is a need to send params. It is chainable like used below is functions 
				// the same as it would if just calling a new object.
				miniSticky.init(new CyntaxicVO(color));
				miniSticky.x = (miniSticky.width + margin) * i;
				miniSticky.addListener(MouseEvent.CLICK, spawnSticky);
				
				add(miniSticky);
			}
		}
		
		private function spawnSticky(event:MouseEvent):void
		{
			debug('Execute command ' + Handles.ADD_STICKY + ' in controller.');
			
			// Add sticky when user clicks the mini sticky. Only a color is needed here.
			// Position is determined by model.currentSticky. Message is blank to start.
			controller.execute(Handles.ADD_STICKY, new CyntaxicVO({color:event.target.color}));
		}
	}
}

