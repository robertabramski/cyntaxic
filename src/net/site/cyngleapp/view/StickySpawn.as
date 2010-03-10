package net.site.cyngleapp.view
{
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.view.CynComposite;
	import com.cytaxic.cyngle.view.interfaces.ICynComposite;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
	import comps.sticky.UIMiniSticky;
	
	import flash.events.MouseEvent;
	
	import net.site.cyngleapp.Handles;
	import net.site.cyngleapp.controller.Controller;
	import net.site.cyngleapp.model.Model;
	import net.site.cyngleapp.model.enums.Colors;

	public class StickySpawn extends CynComposite implements ICynView, ICynComposite
	{
		private var model:Model;
		private var controller:Controller;
		private var margin:Number = 8;
		
		public function StickySpawn()
		{
			model = (_model as Model);
			controller = (_controller as Controller);
			
			for(var i:int = 0; i < model.colors.length; i++)
			{
				var miniSticky:UIMiniSticky = new UIMiniSticky();
				var color:Object = {color:Colors.convertNamedColor(model.colors[i])};
				
				miniSticky.init(new CyntaxicVO(color));
				miniSticky.x = (miniSticky.width + margin) * i;
				miniSticky.addEventListener(MouseEvent.CLICK, spawnSticky);
				
				add(miniSticky);
			}
		}
		
		private function spawnSticky(event:MouseEvent):void
		{
			controller.execute(Handles.ADD_STICKY, new CyntaxicVO({color:event.target.color}));
		}
	}
}

