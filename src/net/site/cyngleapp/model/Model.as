package net.site.cyngleapp.model
{
	import com.cytaxic.cyngle.model.CynModel;

	public class Model extends CynModel
	{
		private static var instance:Model;
		
		public var displayText:String;
		
		public function Model(key:Key)
		{
			
		}
		
		public static function getInstance():Model
		{
			if(!instance) instance = new Model(new Key);
			return instance;
		}
	}
}

internal class Key { }