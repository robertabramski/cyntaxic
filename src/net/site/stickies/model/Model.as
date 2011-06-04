package net.site.stickies.model
{
	import com.cyntaxic.cynmvc.model.CynModel;
	
	import net.site.stickies.model.enums.Colors;
	import net.site.stickies.view.Sticky;
	
	/**
	 * This is the application's Model class. It must extend CynModel and
	 * be passed in the Cyntaxic.init function to use the framework. Here is
	 * where data is stored for the application. CynModel has two functions for 
	 * getting external data called get and post. They are used for simple calls 
	 * to an external source.
	 * 
	 */
	public class Model extends CynModel
	{
		private static var instance:Model;
		
		private var _id:int = 0;
		private var _stickies:Array = [];
		private var _colors:Array = Colors.colors;
		private var _currentSticky:Sticky;
		private var _stickyOffset:Number = 10;

		public function Model(key:Key)
		{
			// As CynModel is an abstract class and Actionscript doesn't support
			// abstract classes this line of code is used for enforcement.
			super(this);
		}
		
		public static function getInstance():Model
		{
			// ActionScript also doesn't have private constructors, so this used to 
			// enforce singleton usage of the Model class.
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

// Internal key for singleton.
internal class Key { }