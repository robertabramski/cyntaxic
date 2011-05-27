
/*/****************************************************************************************************************

	CYNTAXIC FRAMEWORK
	VERSION: 0.0.1
	ACTIONSCRIPT VERSION: 3.0

	AUTHOR: Robert Abramski
	WEBSITE: http://www.robertabramski.com/
	
	BUG LIST:
	
	TO DO:
	- Command stack for undo and redo functionality
	- Preloader functionality using Frame metatag
	- Focus manager
	- Tooltips on all views
	- Global CSS stylesheet
	- Monkey script for writing special VO get/set
	- Add object as last param like TweenLite
	
	CORE GOALS:
	- Less abstraction
	- Less code written for same result
	- More dependence on the controller
	- Works well extending Flash graphics
	- Common tasks built right in
	- Debugging built in
	- Strong typing with value objects
	- Comes with many utilities out of the box
	- Static access to top level objects anywhere
	- Ultilies completely autonomous from framework

******************************************************************************************************************/

package com.cyntaxic.cyngle
{
	import com.cyntaxic.cynccess.cynternal;
	import com.cyntaxic.cyngle.controller.CynController;
	import com.cyntaxic.cyngle.controller.enums.ErrorCodes;
	import com.cyntaxic.cyngle.controller.vos.ErrorCodeVO;
	import com.cyntaxic.cyngle.model.CynModel;
	
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.ui.ContextMenu;
	import flash.utils.describeType;
	
	use namespace cynternal;
	
	public class Cyntaxic
	{
		private static var _INSTANCE:Cyntaxic;
		private static var _STAGE:Stage;
		private static var _ROOT:DisplayObject;
		private static var _FLASH_VARS:FlashVars;
		private static var _DEBUGGER:Debugger;
		private static var _MODEL:CynModel;
		private static var _CONTROLLER:CynController;
		private static var _VERSION:String;
		
		private static var _debug:Boolean = true;
		private static var _deepDebug:Boolean = false;
		private static var _deepDescribe:Boolean = false;
		private static var _fullScaleFlash:Boolean;
		private static var _contextMenu:ContextMenu;
		
		public function Cyntaxic(key:Key, doc:DisplayObject, model:CynModel, controller:CynController, props:Object = null)
		{
			_VERSION = model.version.number;
			
			trace(this + " Started version " + _VERSION + ".");
			
			_STAGE = doc.stage;
			_ROOT = doc;
			
			_DEBUGGER = new Debugger();
			_DEBUGGER.log(_DEBUGGER, "Loaded: " + Cyntaxic.describe(_DEBUGGER));
			
			contextMenu = new BasicContextMenu().getMenu();
			fullScaleFlash = false;
			
			for(var prop:String in props)
			{
				Cyntaxic[prop] = props[prop];
			}
			
			_FLASH_VARS = new FlashVars(doc.root.loaderInfo.parameters);
			_DEBUGGER.log(_FLASH_VARS, "Loaded: " + Cyntaxic.describe(_FLASH_VARS));
			
			_MODEL = model.init();
			_CONTROLLER = controller.init();
		}
		
		public static function init(doc:DisplayObject, model:CynModel, controller:CynController, props:Object = null):Cyntaxic
		{
			_INSTANCE = new Cyntaxic(new Key, doc, model, controller, props);
			return _INSTANCE;
		}
		
		public static function describe(object:Object, compact:Boolean = true):String
		{
			var xml:XML = describeType(object);
			var properties:XMLList = xml..variable.@name + xml..accessor.@name;
			var property:String;
			
			var description:String = "\n{\n";
			var i:int = 0;
			
			for(property in object)
			{
				description += "\t" + property + ":" + displayType(object[property]) + ", \n";
			}
			
			for each(property in properties)
			{
				description += "\t" + property + ":" + displayType(object[property]) + ", \n";
			}
			
			description += "}";
			description = description.replace(/, \n}/, "\n}");
			
			return compact ? description.split("\n").join("").split("\t").join("") : description;
		}
		
		private static function displayType(property:Object):Object
		{
			switch(true)
			{
				case !property: 			return property;
				case property is String: 	return '"' + property + '"';
				case property is Array:		return '[' + property + ']';
				case property is Function:	return '[object Function]';
			}
			
			return property.toString();
		}
		
		public static function get VERSION():String
		{
			return _VERSION;
		}
		
		public static function get STAGE():Stage 
		{
			return _STAGE;
		}
		
		public static function set STAGE(value:Stage):void
		{
			if(!_STAGE) _STAGE = value;
			else throwError(ErrorCodes.E_5000);
		}

		public static function get ROOT():DisplayObject
		{
			return _ROOT;
		}

		public static function set ROOT(value:DisplayObject):void
		{
			if(!_ROOT) _ROOT = value;
			else throwError(ErrorCodes.E_5000);
		}

		public static function get FLASH_VARS():FlashVars
		{
			return _FLASH_VARS;
		}

		public static function set FLASH_VARS(value:FlashVars):void 
		{
			if(!_FLASH_VARS) _FLASH_VARS = value;
			else throwError(ErrorCodes.E_5000);
		}
		
		public static function get DEBUGGER():Debugger
		{
			return _DEBUGGER;
		}
		
		public static function set DEBUGGER(value:Debugger):void
		{
			if(!_DEBUGGER) _DEBUGGER = value;
			else throwError(ErrorCodes.E_5000);
		}
		
		public static function get MODEL():CynModel
		{
			return _MODEL;
		}
		
		public static function set MODEL(value:CynModel):void 
		{
			if(!_MODEL) _MODEL = value;
			else throwError(ErrorCodes.E_5000);
		}
		
		public static function get CONTROLLER():CynController
		{
			return _CONTROLLER;
		}
		
		public static function set CONTROLLER(value:CynController):void 
		{
			if(!_CONTROLLER) _CONTROLLER = value;
			else throwError(ErrorCodes.E_5000);
		}
		
		public static function get contextMenu():ContextMenu
		{
			return _contextMenu;
		}
		
		public static function set contextMenu(value:ContextMenu):void
		{
			_ROOT["contextMenu"] = value;
		}
		
		public static function set fullScaleFlash(value:Boolean):void
		{
			_fullScaleFlash = value;
			
			if(value)
			{
				_STAGE.align = StageAlign.TOP_LEFT;
				_STAGE.scaleMode = StageScaleMode.NO_SCALE;
				
				_STAGE.addEventListener(Event.RESIZE, resizeViews);
			}
			else
			{
				_STAGE.align = "";
				_STAGE.scaleMode = StageScaleMode.SHOW_ALL;
				
				_STAGE.removeEventListener(Event.RESIZE, resizeViews);
			}
		}
		
		public static function get fullScaleFlash():Boolean
		{
			return _fullScaleFlash;
		}
		
		public static function get debug():Boolean 
		{
			return _debug;
		}

		public static function set debug(value:Boolean):void 
		{
			_debug = DEBUGGER.debug = value;
		}

		public static function get deepDebug():Boolean 
		{
			return _deepDebug;
		}

		public static function set deepDebug(value:Boolean):void 
		{
			_deepDebug = DEBUGGER.deepDebug = value;
		}
		
		public static function get deepDescribe():Boolean 
		{
			return _deepDescribe;
		}

		public static function set deepDescribe(value:Boolean):void 
		{
			_deepDescribe = value;
		}
		
		private static function throwError(error:ErrorCodeVO):void
		{
			_CONTROLLER.execute(CyntaxicHandles.THROW_ERROR, error);
		}
		
		private static function resizeViews(event:Event):void
		{
			_CONTROLLER.execute(CyntaxicHandles.RESIZE_VIEWS, null, true);
		}
	}
}

internal dynamic class FlashVars extends Object
{
	public function FlashVars(vars:Object)
	{
		for(var prop:String in vars)
		{
			this[prop] = vars[prop];
		}
	}
	
	public function getVarByName(varName:String):Object
	{
		return this[varName];
	}
} 

internal class Debugger
{
	public var debug:Boolean;
	public var deepDebug:Boolean;
	
	public function Debugger(debug:Boolean = true, deepDebug:Boolean = false)
	{
		this.debug =  debug;
		this.deepDebug = deepDebug;
	}
	
	public function log(messenger:Object, message:String):void
	{
		if(debug) trace(messenger + " " + message);
	}
}

internal class BasicContextMenu
{
	private var cm:flash.ui.ContextMenu; 
	
	public function BasicContextMenu()
	{
		cm = new flash.ui.ContextMenu();
		cm.hideBuiltInItems();
	}
	
	public function getMenu():flash.ui.ContextMenu
	{
		return cm;
	}
}

internal class Key { }


