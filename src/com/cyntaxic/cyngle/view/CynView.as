package com.cyntaxic.cyngle.view
{
	import com.cyntaxic.cyngle.Cyntaxic;
	import com.cyntaxic.cyngle.CyntaxicVO;
	import com.cyntaxic.cyngle.CyntaxicEvent;
	import com.cyntaxic.cyngle.controller.CynController;
	import com.cyntaxic.cyngle.model.CynModel;
	import com.cyntaxic.cyngle.view.interfaces.ICynView;
	import com.cyntaxic.cynccess.cynternal;
	
	import flash.display.Sprite;
	
	public class CynView extends Sprite implements ICynView
	{
		use namespace cynternal;
		
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
				
				if(Cyntaxic.deepDebug)
					Cyntaxic.DEBUGGER.log(this, "Updated view: update(" + event.describe() + ");");
			}
		}
		
		public function resize():void
		{
						
		}
	}
}