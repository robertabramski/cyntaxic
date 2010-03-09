package net.site.cyngleapp.view
{
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.view.CynComposite;
	import com.cytaxic.cyngle.view.CynView;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
	import flash.events.MouseEvent;
	
	import net.site.cyngleapp.Handles;

	public class Box extends CynComposite implements ICynView
	{
		private var viewBox:ViewBox = new ViewBox();
		private var inputBox:InputBox = new InputBox();
		
		public function Box()
		{
			addChild(viewBox); 
			addChild(inputBox);
			
			inputBox.y = viewBox.height + 10;
			
			viewBox.addEventListener(MouseEvent.CLICK, handleViewBoxClick);
		}
		
		override public function init(vo:CyntaxicVO):CynView
		{
			makeCall(vo);
			return this;
		}
		
		private function makeCall(vo:CyntaxicVO):void
		{
			controller.execute(Handles.GET_DATA, vo);
		}  
		
		private function handleViewBoxClick(event:MouseEvent):void
		{
			controller.execute(Handles.REMOVE_VIEW_BOX, null);
		}
		
		public function removeViewBox(vo:CyntaxicVO):void
		{
			this.remove(viewBox);
		}
	}
}