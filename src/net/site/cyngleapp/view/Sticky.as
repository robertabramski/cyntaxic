package net.site.cyngleapp.view
{
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.view.CynComponent;
	import com.cytaxic.cyngle.view.CynView;
	import com.cytaxic.cyngle.view.interfaces.ICynComponent;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
	import net.site.cyngleapp.model.vos.StickyVO;

	public class Sticky extends CynComponent implements ICynView, ICynComponent
	{
		public var id:int;
		public var message:String;
		public var color:uint;
		public var vo:StickyVO;
		
		public function Sticky()
		{
			
		}
		
		override public function init(vo:CyntaxicVO):CynView
		{
			var sticky:StickyVO = vo as StickyVO;
			
			this.id = sticky.id;
			this.message = sticky.message;
			this.color = sticky.color;
			this.vo = sticky;
			
			return this;
		}
		
		/*public function update(event:CyntaxicEvent):void
		{
			
		}
		
		public function redraw():void
		{
			
		}*/
	}
}