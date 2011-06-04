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
				var miniSticky:UIMiniSticky = new UIMiniSticky();
				var color:Object = {color:Colors.convertNamedColor(model.colors[i])};
				
				miniSticky.init(new CyntaxicVO(color));
				miniSticky.x = (miniSticky.width + margin) * i;
				miniSticky.addListener(MouseEvent.CLICK, spawnSticky);
				
				add(miniSticky);
			}
		}
		
		private function spawnSticky(event:MouseEvent):void
		{
			debug('Execute command ' + Handles.ADD_STICKY + ' in controller.');
			controller.execute(Handles.ADD_STICKY, new CyntaxicVO({color:event.target.color}));
		}
	}
}

