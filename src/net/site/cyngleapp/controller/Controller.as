package net.site.cyngleapp.controller
{
	import com.cytaxic.cyngle.CyntaxicEvent;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.controller.CynController;
	import com.cytaxic.cyngle.controller.helpers.DataCall;
	import com.cytaxic.cyngle.controller.helpers.DataCallEvent;
	import com.cytaxic.cyngle.controller.vos.DataCallVO;
	
	import net.site.cyngleapp.Handles;

	public class Controller extends CynController
	{
		private static var instance:Controller;
		
		public function Controller(key:Key)
		{
			
		}
		
		public static function getInstance():Controller
		{
			if(!instance) instance = new Controller(new Key);
			return instance;
		}
	}
}

internal class Key { }