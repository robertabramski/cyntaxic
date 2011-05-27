package net.site.cyngleapp.model
{
	import com.cyntaxic.cyngle.model.CynModel;
	
	import net.site.cyngleapp.model.enums.Colors;
	import net.site.cyngleapp.view.Sticky;

	public class Model extends CynModel
	{
		private static var instance:Model;
		
		private var _id:int;
		private var _stickies:Array = [];
		private var _colors:Array = Colors.colors;
		private var _currentSticky:Sticky;
		private var _stickyOffset:Number = 10;

		public function Model(key:Key)
		{
			
		}
		
		public static function getInstance():Model
		{
			if(!instance) instance = new Model(new Key);
			return instance;
		}
		
		public function get id():int { return _id; }
		public function set id(value:int):void { _id = value; }
		
		public function get stickies():Array { return _stickies; }
		public function set stickies(value:Array):void { _stickies = value; }
		
		public function get colors():Array{ return _colors; }
		
		public function get currentSticky():Sticky { return _currentSticky; }
		public function set currentSticky(value:Sticky):void { _currentSticky = value; }
		
		public function get stickyOffset():Number { return _stickyOffset; }
	}
}

internal class Key { }