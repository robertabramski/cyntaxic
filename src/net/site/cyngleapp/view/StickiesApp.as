package net.site.cyngleapp.view
{
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
	import net.site.cyngleapp.model.vos.StickyVO;

	public class StickiesApp extends CynComposite implements ICynComposite, ICynView
	{
		private var header:UIStickyHeader = new UIStickyHeader();
		private var call:DataCall;
		
		public function StickiesApp()
		{
			add(header);
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
		}
		
		public function removeSticky(vo:CyntaxicVO):void
		{
			remove(getChildAt((vo as StickyVO).id + 1) as CynView);
		}
		
		private function handleRemoveSticky(event:MouseEvent):void
		{
			//controller.execute(Handles.REMOVE_STICKY, event.target.vo);
		}
		
		/*public function update(event:CyntaxicEvent):void
		{
		}
		
		public function resize():void
		{
			
		}
		
		public function add(child:CynView):CynView
		{
			return null;
		}
		
		public function addAt(child:CynView, index:int):CynView
		{
			return null;
		}
		
		public function remove(child:CynView):CynView
		{
			return null;
		}
		
		public function removeAt(index:int):CynView
		{
			return null;
		}*/
	}
}