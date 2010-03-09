package net.site.cyngleapp.view
{
	import com.cytaxic.cyngle.CyntaxicEvent;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.view.CynComposite;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
	import flash.text.TextField;

	public class ViewBox extends CynComposite implements ICynView
	{
		private var box:TextField;
		
		public function ViewBox()
		{
			box = new TextField();
			box.width = 400;
			box.height = 20;
			box.border = true;
			
			addChild(box);
		}
		
		public function changeText(vo:CyntaxicVO):void
		{
			box.text = vo.text;
		}
	}
}