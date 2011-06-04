﻿package net.site.stickies.view{	import com.cyntaxic.cynmvc.CyntaxicVO;	import com.cyntaxic.cynmvc.view.CynComposite;	import com.cyntaxic.cynmvc.view.CynView;	import com.cyntaxic.cynmvc.view.interfaces.ICynComposite;	import com.cyntaxic.cynmvc.view.interfaces.ICynView;		import comps.fonts.UIMarkerFelt;	import comps.sticky.UISticky;		import flash.display.Shape;	import flash.events.MouseEvent;	import flash.filters.DropShadowFilter;	import flash.geom.ColorTransform;	import flash.text.AntiAliasType;	import flash.text.Font;	import flash.text.TextField;	import flash.text.TextFieldType;	import flash.text.TextFormat;		import net.site.stickies.Handles;	import net.site.stickies.controller.Controller;	import net.site.stickies.model.Model;	import net.site.stickies.model.vos.StickyVO;		/**	 * All views should extend either CynComposite or CynComponent. CynComposite is used for	 * views that have other views inside of it. CynComposite has functions like add, addAt, remove	 * and removeAt which work just like addChild and removeChild except for some added functionality	 * for the framework. CynComponent has no CynView children and doesn't have any of the above functions.	 * 	 */	public class Sticky extends CynComposite implements ICynView, ICynComposite	{		public var vo:StickyVO;		public var id:int;		public var message:String = "";		public var color:uint;				private var model:Model;		private var controller:Controller;		private var dropShadow:DropShadowFilter = new DropShadowFilter(3, 70, 0, .4, 5, 5, 1, 3);		private var colorTransform:ColorTransform;		private var stickyShape:Shape;		private var note:TextField = new TextField();		private var markerFelt:Font = new UIMarkerFelt();		private var margin:Number = 10;		private var format:TextFormat = new TextFormat(markerFelt.fontName, 17);		private var close:Close = new Close();				public function Sticky()		{			model = (cynModel as Model);			controller = (cynController as Controller);						stickyShape = this.getChildAt(0) as Shape;						format.leading = 2;						with(note)			{				type = TextFieldType.INPUT;				selectable = true;				multiline = true;				width = stickyShape.width - margin * 2;				x = y = margin;				wordWrap = true;				defaultTextFormat = format;				antiAliasType = AntiAliasType.ADVANCED;			}						addChild(note);						this.filters = [dropShadow];			this.buttonMode = true;						addListener(MouseEvent.MOUSE_DOWN, startDragging);			addListener(MouseEvent.MOUSE_UP, stopDragging); 						add(close, {visible:false});			close.x = close.y = -12;			addListener(MouseEvent.ROLL_OVER, showClose);			addListener(MouseEvent.ROLL_OUT, hideClose);			close.addListener(MouseEvent.CLICK, closeSticky);		}				/**		 * The init function can be useful when extending graphics only classes. This		 * is the base class for UISticky. UISticky can't have any params sent to its 		 * constructor, so this is the next best thing. It returns itself for chainibility.  		 * 		 */				override public function init(vo:CyntaxicVO):CynView		{			var sticky:StickyVO = vo as StickyVO;						this.vo = sticky;			this.id = sticky.id;			this.message = sticky.message;			this.color = sticky.color;						colorTransform = new ColorTransform();			colorTransform.color = sticky.color;			stickyShape.transform.colorTransform = colorTransform;						note.htmlText = sticky.message;			note.height = note.textHeight + margin;						return this;		}				private function hideClose(event:MouseEvent):void		{			close.visible = false;		}				private function showClose(event:MouseEvent):void		{			close.visible = true;		}				private function closeSticky(event:MouseEvent):void		{			debug('Execute command ' + Handles.REMOVE_STICKY + ' in controller.');			controller.execute(Handles.REMOVE_STICKY, new CyntaxicVO({sticky:this}));		}				private function startDragging(event:MouseEvent):void		{			if(event.target is UISticky)			{				this.parent.addChild(this);				startDrag();								model.currentSticky = event.target as Sticky;			}		}				private function stopDragging(event:MouseEvent):void		{			stopDrag();		}	}}