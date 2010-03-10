package net.site.cyngleapp.model
{
	import com.cytaxic.cyngle.model.CynModel;
	
	import net.site.cyngleapp.model.enums.Colors;

	public class Model extends CynModel
	{
		private static var instance:Model;
		
		private var _stickies:Array = [];
		private var _colors:Array = Colors.colors;
		private var _id:int;

		public function Model(key:Key)
		{
			
		}
		
		public static function getInstance():Model
		{
			if(!instance) instance = new Model(new Key);
			return instance;
		}
		
		public function get stickies():Array 
		{
			return _stickies;
		}

		public function set stickies(value:Array):void 
		{
			_stickies = value;
		}
		
		public function get colors():Array
		{
			return _colors;
		}
		
		public function get id():int 
		{
			return _id;
		}

		public function set id(value:int):void 
		{
			_id = value;
		}
	}
}

internal class Key { }