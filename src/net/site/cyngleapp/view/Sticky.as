﻿package net.site.cyngleapp.view{	import com.cytaxic.cyngle.CyntaxicVO;	import com.cytaxic.cyngle.view.CynComponent;	import com.cytaxic.cyngle.view.CynView;	import com.cytaxic.cyngle.view.interfaces.ICynComponent;	import com.cytaxic.cyngle.view.interfaces.ICynView;		import comps.fonts.UIMarkerFelt;	import comps.sticky.UISticky;		import flash.display.Shape;	import flash.events.Event;	import flash.events.MouseEvent;	import flash.filters.DropShadowFilter;	import flash.geom.ColorTransform;	import flash.text.AntiAliasType;	import flash.text.Font;	import flash.text.TextField;	import flash.text.TextFieldType;	import flash.text.TextFormat;		import net.site.cyngleapp.model.Model;	import net.site.cyngleapp.model.vos.StickyVO;	public class Sticky extends CynComponent implements ICynView, ICynComponent	{		public var id:int;		public var message:String = "";		public var color:uint;				private var model:Model;		private var dropShadow:DropShadowFilter = new DropShadowFilter(3, 70, 0, .4, 5, 5, 1, 3);		private var colorTransform:ColorTransform;		private var stickyShape:Shape;		private var note:TextField = new TextField();		private var markerFelt:Font = new UIMarkerFelt();		private var margin:Number = 10;		private var format:TextFormat = new TextFormat(markerFelt.fontName, 17);				public function Sticky()		{			model = (_model as Model);						stickyShape = this.getChildAt(0) as Shape;						format.leading = 2;						with(note)			{				type = TextFieldType.INPUT;				selectable = true;				multiline = true;				width = stickyShape.width - margin * 2;				x = y = margin;				wordWrap = true;				defaultTextFormat = format;				antiAliasType = AntiAliasType.ADVANCED;			}						addChild(note);						this.filters = [dropShadow];			this.buttonMode = true;						addEventListener(MouseEvent.MOUSE_DOWN, startDragging);			addEventListener(MouseEvent.MOUSE_UP, stopDragging);			addEventListener(Event.CHANGE, resizeNote);		}				override public function init(vo:CyntaxicVO):CynView		{			var sticky:StickyVO = vo as StickyVO;						this.id = sticky.id;			this.message = sticky.message;			this.color = sticky.color;						colorTransform = new ColorTransform();			colorTransform.color = sticky.color;			stickyShape.transform.colorTransform = colorTransform;						note.htmlText = sticky.message;			note.height = note.textHeight + margin;						return this;		}				private function startDragging(event:MouseEvent):void		{			if(event.target is UISticky)			{				this.parent.addChild(this);				startDrag();								model.currentSticky = event.target as Sticky;			}		}				private function stopDragging(event:MouseEvent):void		{			stopDrag();		}				private function resizeNote(event:Event):void		{			if(note.textHeight < (stickyShape.height - margin))			{				note.height = note.textHeight + margin;			}		}	}}