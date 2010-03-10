package com.cytaxic.cyngle.view
{
	import com.cytaxic.cyngle.Cyntaxic;
	import com.cytaxic.cyngle.CyntaxicEvent;
	import com.cytaxic.cyngle.CyntaxicVO;
	import com.cytaxic.cyngle.controller.CynController;
	import com.cytaxic.cyngle.model.CynModel;
	import com.cytaxic.cyngle.view.interfaces.ICynView;
	
	import flash.display.Sprite;

	public class CynView extends Sprite implements ICynView
	{
		protected var cynModel:CynModel;
		protected var cynController:CynController;
		
		public function CynView()
		{
			cynModel = Cyntaxic.MODEL;
			cynController = Cyntaxic.CONTROLLER;
			
			cynModel.addEventListener(CyntaxicEvent.NOTIFY, update);
			cynController.addEventListener(CyntaxicEvent.NOTIFY, update);
			
			cynModel.views.push(this);
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
		
		public function resize():void
		{
			
		}
	}
}