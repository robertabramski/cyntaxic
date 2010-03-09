package net.site.cyngleapp.model
{
	import com.cytaxic.cyngle.model.CynModel;
	
	import net.site.cyngleapp.view.Sticky;

	public class Model extends CynModel
	{
		private static var instance:Model;
		
		private var _stickies:Array = [];
		
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
	}
}

internal class Key { }