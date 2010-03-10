package net.site.cyngleapp.view
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.controller.helpers.DataCall;
	import com.cytaxic.cyngle.controller.helpers.DataCallEvent;
	import com.cytaxic.cyngle.view.CynComposite;
	import com.cytaxic.cyngle.view.CynView;
	import com.cytaxic.cyngle.view.interfaces.ICynComposite;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
	import comps.header.UIStickyHeader;
	import comps.sticky.UISticky;
	
	import flash.events.MouseEvent;
	
	import net.site.cyngleapp.Handles;
	import net.site.cyngleapp.controller.Controller;
	import net.site.cyngleapp.model.Model;
	import net.site.cyngleapp.model.vos.StickyVO;

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
			model = (_model as Model);
			controller = (_controller as Controller);
			
			add(header);
			add(stickySpawn);
			
			resize();
		}
		
		override public function init(vo:CyntaxicVO):CynView
		{
			call = new DataCall(vo.config);
			call.addEventListener(DataCallEvent.COMPLETE, addConfigStickies);
			
			return this;
		}
		
		private function addConfigStickies(event:DataCallEvent):void
		{
			controller.execute(Handles.ADD_CONFIG_STICKIES, event.data);
		}
		
		public function addSticky(vo:CyntaxicVO):void
		{
			var sticky:CynView = new UISticky().init(vo as StickyVO);
			
			sticky.x = (vo as StickyVO).x;
			sticky.y = (vo as StickyVO).y;
			add(sticky);
			
			model.stickies.push(sticky);
			model.currentSticky = sticky as Sticky;
		}
		
		public function removeSticky(vo:CyntaxicVO):void
		{
			
		}
		
		private function handleRemoveSticky(event:MouseEvent):void
		{
			//controller.execute(Handles.REMOVE_STICKY, new CyntaxicVO({sticky:event.currentTarget}));
		}
		
		override public function resize():void
		{
			stickySpawn.x = Cyntaxic.STAGE.stageWidth - stickySpawn.width - margin;
			stickySpawn.y = margin;
		}
	}
}