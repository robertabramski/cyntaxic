package com.cytaxic.cyngle.view
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.CyntaxicEvent;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.controller.CynController;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
	import flash.display.Sprite;

	public class CynView extends Sprite implements ICynView
	{
		protected var model:*;
		protected var controller:CynController;
		
		public function CynView()
		{
			model = Cyntaxic.MODEL;
			controller = Cyntaxic.CONTROLLER;
			
			model.addEventListener(CyntaxicEvent.NOTIFY, update);
			controller.addEventListener(CyntaxicEvent.NOTIFY, update);
			
			Cyntaxic.VIEWS.push(this);
		}
		
		public function init(vo:CyntaxicVO):CynView
		{
			return this;
		}
		
		public function update(event:CyntaxicEvent):void
		{
			if(this.hasOwnProperty(event.handle))
			{
				this[event.handle](event.vo);
				
				if(Cyntaxic.DEEP_DEBUG)
					Cyntaxic.DEBUGGER.log(this, "Updated view: update(" + event.describe() + ");");
			}
		}
		
		public function redraw():void
		{
			
		}
	}
}