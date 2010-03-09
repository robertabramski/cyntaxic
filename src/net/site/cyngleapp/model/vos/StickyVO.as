package net.site.cyngleapp.model.vos
{
	import com.cytaxic.cyngle.CyntaxicVO;

	public class StickyVO extends CyntaxicVO
	{
		public var id:int;
		public var message:String;
		public var color:uint;
		public var x:Number;
		public var y:Number;
		
		public function StickyVO(id:int, message:String, color:uint, x:Number, y:Number)
		{
			this.id = append("id", id);
			this.message = append("message", message);
			this.color = append("color", color);
			this.x = append("x", x);
			this.y = append("y", y);
		}
	}
}