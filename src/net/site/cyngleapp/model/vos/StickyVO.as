package net.site.cyngleapp.model.vos
{
	import com.cyntaxic.cyngle.CyntaxicVO;

	public class StickyVO extends CyntaxicVO
	{
		private var _id:int;
		private var _message:String;
		private var _color:uint;
		private var _x:Number;
		private var _y:Number;
		
		public function StickyVO(id:int, message:String, color:uint, x:Number, y:Number)
		{
			this.id = id;
			this.message = message;
			this.color = color;
			this.x = x;
			this.y = y;
		}
		
		public function get id():int 
		{
			return _id;
		}

		public function set id(value:int):void 
		{
			_id = append("id", value);
		}

		public function get message():String 
		{
			return _message;
		}

		public function set message(value:String):void 
		{
			_message = append("message", value);
		}

		public function get color():uint 
		{
			return _color;
		}

		public function set color(value:uint):void 
		{
			_color = append("color", value);
		}

		public function get x():Number 
		{
			return _x;
		}

		public function set x(value:Number):void 
		{
			_x = append("x", value);
		}

		public function get y():Number 
		{
			return _y;
		}

		public function set y(value:Number):void 
		{
			_y = append("y", value);
		}
	}
}