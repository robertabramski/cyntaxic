
/*/****************************************************************************************************************

	CYNTAXIC FRAMEWORK
	VERSION: 1.0.0
	ACTIONSCRIPT VERSION: 3.0

	AUTHOR: Robert Abramski
	WEBSITE: http://www.robertabramski.com/

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
		private static var _FLASH_VARS:FlashVarsVO;
		private static var _DEBUGGER:Debugger;
		private static var _MODEL:CynModel;
		private static var _CONTROLLER:CynController;
		private static var _VERSION:String;
		
		private static var _debug:Boolean = true;
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
			
			contextMenu = new BasicContextMenu().getMenu();
			fullScaleFlash = false;
			
			for(var prop:String in props)
			{
				Cyntaxic[prop] = props[prop];
			}
			
			_DEBUGGER.log(_DEBUGGER, "Debugger is running.");
			
			_FLASH_VARS = new FlashVarsVO(doc.root.loaderInfo.parameters);
			
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
			return ObjectDescriptor.getString(object, compact);
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

		public static function get FLASH_VARS_VO():FlashVarsVO
		{
			return _FLASH_VARS;
		}

		public static function set FLASH_VARS_VO(value:FlashVarsVO):void 
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
			_CONTROLLER.execute(CyntaxicHandles.RESIZE_VIEWS, null);
		}
	}
}
import com.cyntaxic.cyngle.Cyntaxic;

import flash.utils.describeType;

import spark.primitives.Line;

internal dynamic class FlashVarsVO extends com.cyntaxic.cyngle.CyntaxicVO
{
	public function FlashVarsVO(vars:Object)
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
	
	public function Debugger(debug:Boolean = true)
	{
		this.debug = debug;
	}
	
	public function log(messenger:Object, message:Object):void
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

internal class ObjectDescriptor 
{
	public static function getString(object:Object, compact:Boolean):String
	{
		return compact ? convertToString(object) : format(convertToString(object));
	}
	
	private static function format(val:String):String
	{
		var formatted:String = '';
		var str:String = val;
		var pos:int = 0;
		var strLen:int = str.length;
		var indentStr:String = '\t';
		var newLine:String = '\n';
		var char:String = '';
		var inString:Boolean = false;
		
		for(var i:int = 0; i < strLen; i++) 
		{
			char = str.substring(i, i + 1);
			
			if(char == '"' && !inString) inString = true;
			else if(char == '"' && inString) inString = false;
			
			if(char == '}' || char == ']')
			{
				if(!inString) formatted = formatted + newLine;
				pos = pos - 1;
				
				for(var j:int = 0; j < pos; j++) 
				{
					if(!inString) formatted = formatted + indentStr;
				}
			}
			
			formatted = formatted + char;
			
			if(char == '{' || char == '[' || char == ',')
			{
				if(!inString) formatted = formatted + newLine;
				
				if(char == '{' || char == '[')
				{
					pos = pos + 1;
				}
				
				for(var k:int = 0; k < pos; k++)
				{
					if(!inString) formatted = formatted + indentStr;
				}
			}
			
			if(char == ':')
			{
				var nextChar:String = str.substring(i + 1, i + 2);
				var tokenIsNext:Boolean = (nextChar == '{' || nextChar == '[');
				
				if(!inString && tokenIsNext) formatted = formatted + newLine;
				
				for(var l:int = 0; l < pos; l++)
				{
					if(!inString && tokenIsNext) formatted = formatted + indentStr;
				}
			}
		}
		
		return newLine + formatted;
	}
	
	private static function convertToString(value:Object):String 
	{
		switch(true)
		{
			case (value is String): 					return escapeString(value as String);
			case (value is Number): 					return isFinite(value as Number) ? value.toString() : "null";
			case (value is Function): 					return escapeString("[object Function]");
			case (value is Boolean):					return value ? "true" : "false";
			case (value is Array):						return arrayToString(value as Array);
			case (value is Object && value != null): 	return objectToString(value);
			
			default: 									return "null";
		}
	}
	
	private static function escapeString(str:String):String 
	{
		var s:String = "";
		var ch:String;
		var len:Number = str.length;
		
		for(var i:int = 0; i < len; i++) 
		{
			ch = str.charAt(i);
			
			switch(ch)
			{
				case '"': 	s += "\\\""; 	break; // quotation mark
				case '\\': 	s += "\\\\"; 	break; // reverse solidus
				case '\b': 	s += "\\b"; 	break; // bell
				case '\f':	s += "\\f";		break; // form feed
				case '\n':	s += "\\n";		break; // newline
				case '\r':	s += "\\r";		break; // carriage return
				case '\t':	s += "\\t";		break; // horizontal tab
				
				default:
					
				if(ch < ' ')
				{
					var hexCode:String = ch.charCodeAt(0).toString(16);
					var zeroPad:String = hexCode.length == 2 ? "00" : "000";
					s += "\\u" + zeroPad + hexCode;
				}
				else s += ch;
			}
		}
		
		return "\"" + s + "\"";
	}
	
	private static function arrayToString(a:Array):String 
	{
		var s:String = "";
		var classInfo:XML = flash.utils.describeType(a);
		var className:String = classInfo.@name;
		var baseClass:String = classInfo.@base;
		
		for(var i:int = 0; i < a.length; i++)
		{
			if(s.length > 0) s += ","; 
			s += convertToString(a[i]);	
		}
		
		return '{"name":' + escapeString(className) + ',"base":' + escapeString(baseClass) + ',"properties":[' + s + ']}';
	}
	
	private static function objectToString(o:Object):String
	{
		var s:String = "";
		var classInfo:XML = flash.utils.describeType(o);
		var className:String = classInfo.@name;
		var baseClass:String = classInfo.@base;
		var appendObjectString:Function = function(s:String, v:XML):String
		{
			var t:String = "";
			
			if(s.length > 0) t += ",";
			try { t += escapeString(v.@name.toString()) + ":" + convertToString(o[v.@name]); }
			catch(error:Error) { t += escapeString(v.@name.toString()) + ':"[write-only]"';  }
			
			return t;
		};
		
		for(var key:String in o)
		{
			if(s.length > 0) s += ",";
			
			var value:Object = o[key];
			s += escapeString(key) + ":" + convertToString(value);
		}
		
		for each(var v:XML in classInfo..*.(name() == "variable" || name() == "accessor"))
		{
			if(Cyntaxic.deepDescribe)
			{
				s += appendObjectString(s, v);
			}
			else
			{
				if(v.@declaredBy.toString().indexOf('flash') == -1)
				{
					s += appendObjectString(s, v);
				}
			}
		}
		
		return '{"name":' + escapeString(className) + ',"base":' + escapeString(baseClass) + ',"properties":{' + s + '}}';
	}
}
