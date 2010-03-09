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
		
		public function getData(vo:CyntaxicVO):void
		{
			var dataCall:DataCallVO = vo as DataCallVO;
			var call:DataCall = new DataCall(dataCall.url, dataCall.method, dataCall.data, dataCall.contentType);
			
			call.addEventListener(DataCallEvent.COMPLETE, test);
		}
		
		private function test(event:DataCallEvent):void
		{
			trace(event.data.describe());
		}
		
		public function changeText(vo:CyntaxicVO):void
		{
			model.displayText = vo.text;
			dispatchEvent(new CyntaxicEvent(Handles.CHANGE_TEXT, vo));
		}
		
		public function removeViewBox(vo:CyntaxicVO):void
		{
			dispatchEvent(new CyntaxicEvent(Handles.REMOVE_VIEW_BOX, vo));
		}
	}
}

internal class Key { }