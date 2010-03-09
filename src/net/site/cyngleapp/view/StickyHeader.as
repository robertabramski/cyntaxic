package net.site.cyngleapp.view
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.view.CynComposite;
	import com.cytaxic.cyngle.view.interfaces.ICynComposite;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
	import flash.display.GradientType;
	import flash.display.Shape;

	public class StickyHeader extends CynComposite implements ICynComposite, ICynView
	{
		private var back:Shape = new Shape();
		
		public function StickyHeader()
		{
			with(back.graphics)
			{
				beginGradientFill(GradientType.LINEAR, [0xFF0000, 0x00FF00], [0, 200], [1, 1]);
				drawRect(0, 0, Cyntaxic.STAGE.stageWidth, 50);
				endFill();
			}
			
			addChild(back);
		}
		
		/*public function init(vo:CyntaxicVO):CynView
		{
			return null;
		}
		
		public function update(event:CyntaxicEvent):void
		{
		}*/
		
		override public function redraw():void
		{
			with(back.graphics)
			{
				clear();
				beginGradientFill(GradientType.LINEAR, [0xFF0000, 0x00FF00], [0, 200], [1, 1]);
				drawRect(0, 0, Cyntaxic.STAGE.stageWidth, 50);
				endFill();
			}
		}
		
		/*public function add(child:CynView):CynView
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