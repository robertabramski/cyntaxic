package net.site.cyngleapp.view
{
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.view.CynComponent;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import net.site.cyngleapp.Handles;

	public class InputBox extends CynComponent implements ICynView
	{
		private var input:TextField;
		
		public function InputBox()
		{
			input = new TextField();
			input.type = TextFieldType.INPUT;
			input.border = true;
			input.width = 400;
			input.height = 20;
			
			addChild(input);
			input.addEventListener(TextEvent.TEXT_INPUT, changeText);
		}
		
		private function changeText(event:TextEvent):void
		{
			var vo:CyntaxicVO = new CyntaxicVO();
			vo.text = event.text;
			
			controller.execute(Handles.CHANGE_TEXT, vo);
		}
	}
}