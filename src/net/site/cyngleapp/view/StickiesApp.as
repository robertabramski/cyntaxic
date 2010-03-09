package net.site.cyngleapp.view
{
	import com.cytaxic.cyngle.view.CynComposite;
	import com.cytaxic.cyngle.view.interfaces.ICynComposite;
	import com.cytaxic.cyngle.view.interfaces.ICynView;

	public class StickiesApp extends CynComposite implements ICynComposite, ICynView
	{
		private var header:StickyHeader = new StickyHeader();
		
		public function StickiesApp()
		{
			add(header);
		}
		
		/*public function init(vo:CyntaxicVO):CynView
		{
			return null;
		}
		
		public function update(event:CyntaxicEvent):void
		{
		}
		
		public function redraw():void
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