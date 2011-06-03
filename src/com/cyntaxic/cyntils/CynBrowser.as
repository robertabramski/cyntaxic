package com.cyntaxic.cyntils
{
	import flash.external.ExternalInterface;
	
	/**
	 * <code>CynBrowser</code> holds a number of static functions to easily 
	 * get information about the SWF's containing HTML page including browser
	 * detection and URL manipulation.
	 * 
	 * <code>CynBrowser</code> holds all of the JavaScript code inline inside the
	 * class to prevent needing additional files besides the class itself.
	 *  
	 * @author robertabramski
	 * 
	 */
	public class CynBrowser
	{
		private static const instance:String = "[object CynBrowser]";
		
		/**
		 * Defines the value of the <code>navigator.userAgent</code> 
		 * string for the Google Chrome Browser.
		 * 
		 * @see #isBrowser()
		 * 
		 */
		public static const CHROME:String = "Chrome";
		
		/**
		 * Defines the value of the <code>navigator.userAgent</code> 
		 * string for the Opera Browser.
		 * 
		 * @see #isBrowser()
		 * 
		 */
		public static const OPERA:String = "Opera";
		
		/**
		 * Defines the value of the <code>navigator.userAgent</code> 
		 * string for the Apple Safari Browser.
		 * 
		 * @see #isBrowser()
		 * 
		 */
		public static const SAFARI:String = "Safari";
		
		/**
		 * Defines the value of the <code>navigator.userAgent</code> 
		 * string for the Internet Explorer Browser.
		 * 
		 * @see #isBrowser()
		 * 
		 */
		public static const MSIE:String = "MSIE";
		
		/**
		 * Defines the value of the <code>navigator.userAgent</code> 
		 * string for the Mozilla Firefox Browser.
		 * 
		 * @see #isBrowser()
		 * 
		 */
		public static const FIREFOX:String = "Firefox";
		
		/**
		 * Defines the value of the <code>navigator.userAgent</code> 
		 * string for the SeaMonkey Browser.
		 * 
		 * @see #isBrowser()
		 * 
		 */
		public static const SEAMONKEY:String = "SeaMonkey";
		
		private static const BROWSER_NAME:String = "browserName";
		private static const FULL_VERSION:String = "fullVersion";
		private static const MAJOR_VERSION:String = "majorVersion";
		private static const USER_AGENT:String = "userAgent";
		private static const APP_NAME:String = "appName";
		
		private static const BROWSER_NAMES:Array = [CHROME, OPERA, SAFARI, MSIE, FIREFOX, SEAMONKEY];
		
		private static const EXTERNALINTERFACE_UNAVILABLE:String = instance + " ExternalInterface is unavailable.";
		private static const NOT_A_BROWSER:String = instance + " Browser does not appear to be valid. Use Browser.userAgent to see exact string.";
		
		private static const GET_URL:String = 'function() { return window.location.href; }';
		private static const GET_USER_AGENT:String = 'function() { return navigator.userAgent; }';
		private static const GET_APP_NAME:String = 'function() { return navigator.appName; }';
		private static const GET_BROWSER_INFO:String = 
			
		'function(browserName) ' +
		'{' +
			'var versionStart = (navigator.userAgent.indexOf("Version") != -1) ? "Version" : browserName;' +
			'var versionOffset = navigator.userAgent.indexOf(versionStart);' +
			
			'var fullVersion = navigator.userAgent.substring(versionOffset + versionStart.length + 1).split(" ")[0].split(";")[0];' +
			'var majorVersion = parseInt(fullVersion).toString();' +
			
			'return {' +
						'browserName:browserName,' +
						'fullVersion:fullVersion,' +
						'majorVersion:majorVersion,' +
						'appName:navigator.appName,' +
						'userAgent:navigator.userAgent' +
					'}' +
		'}';
		
		private static function getProperty(property:String):String
		{
			try
			{
				if(ExternalInterface.available)
				{
					return ExternalInterface.call(GET_BROWSER_INFO, getBrowser())[property];
				}
				else trace(EXTERNALINTERFACE_UNAVILABLE);
			}
			catch(error:Error) { trace(NOT_A_BROWSER); }
			
			return "";
		}
		
		private static function getBrowser():String
		{
			try
			{
				if(ExternalInterface.available)
				{
					var browsers:Array = BROWSER_NAMES;
					var userAgent:String = userAgent();
					
					for(var i:int = 0; i < browsers.length; i++)
					{
						if(userAgent.indexOf(browsers[i]) != -1)
						{
							return ExternalInterface.call(GET_BROWSER_INFO, browsers[i]).browserName;
						}
					}
				}
				else trace(EXTERNALINTERFACE_UNAVILABLE);
			}
			catch(error:Error) { trace(NOT_A_BROWSER); }
			
			return "";
		}
		
		/**
		 * Checks to see if the param string is the browser being used. The 
		 * function adds the attempted browser name to the tested browser array using 
		 * <code>getBrowserNames</code>. 
		 *  
		 * @param browser The browser string to check against. 
		 * @return True if the browser string matches part of <code>navigator.userAgent</code> string.
		 * 
		 * @see #getBrowserNames()
		 * 
		 */
		public static function isBrowser(browser:String):Boolean
		{
			addBrowserName(browser);
			
			try
			{
				if(ExternalInterface.available)
				{
					return ExternalInterface.call(GET_BROWSER_INFO, browser).browserName == getBrowser();
				}
				else trace(EXTERNALINTERFACE_UNAVILABLE);
			}
			catch(error:Error) { trace(NOT_A_BROWSER); }
			
			return false;
		}
		
		/**
		 * Gets the value of the query string parameter passed in.
		 *  
		 * @param param The string value of the query param. 
		 * @return The value of the param or a blank string.
		 * 
		 */
		public static function getQueryParam(param:String):String
		{
			try
			{
				if(ExternalInterface.available)
				{
					var param:String = param.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
					var regexString:String = "[\\?&]" + param + "=([^&#]*)";
					var regex:RegExp = new RegExp(regexString);
					var results:* = regex.exec(ExternalInterface.call(GET_URL));
					
					if(results == null) return "";
					else return results[1];
				}
				else trace(EXTERNALINTERFACE_UNAVILABLE);
			}
			catch(error:Error) { trace(instance + " " + error.toString()); }
			
			return "";
		}
		
		/**
		 * Returns the JavaScript <code>window.location.href</code>.
		 * 
		 * @base If true, only the base url is returned. Default is false.
		 * @protocol If false, the protocol is removed from the string. Default is true.
		 *  
		 * @return The url string affected by parameters.
		 * 
		 */		
		public static function url(base:Boolean = false, protocol:Boolean = true):String
		{
			try
			{
				if(ExternalInterface.available)
				{
					var url:String = ExternalInterface.call(GET_URL);
					var parts:Array = url.split("/");
					
					if(!protocol) parts = [parts[2], parts[parts.length - 1]];
					if(base) parts.pop();
					
					return parts.join("/");
				}
				else trace(EXTERNALINTERFACE_UNAVILABLE);
			}
			catch(error:Error) { trace(instance + " " + error.toString()); }
			
			return "";
		}
		
		/**
		 * Gets the name of the browser by extraction from the <code>navigator.userAgent</code> string. 
		 *  
		 * @return The name of the browser.
		 * 
		 */
		public static function browserName():String
		{
			return getProperty(BROWSER_NAME);
		}
		
		/**
		 * Gets the full browser version by extraction from the <code>navigator.userAgent</code> string. 
		 *  
		 * @return The full version of the browser.
		 * 
		 */
		public static function fullVersion():String
		{
			return getProperty(FULL_VERSION);
		}
		
		/**
		 * Gets only the major browser version by extraction from the <code>navigator.userAgent</code> string. 
		 *  
		 * @return The major version of the browser.
		 * 
		 */
		public static function majorVersion():String
		{
			return getProperty(MAJOR_VERSION);
		}
		
		/**
		 * Gets <code>navigator.userAgent</code> from JavaScript. 
		 *  
		 * @return The user agent string.
		 * 
		 */
		public static function userAgent():String
		{
			try
			{
				if(ExternalInterface.available)
				{
					return ExternalInterface.call(GET_USER_AGENT);
				}
				else trace(EXTERNALINTERFACE_UNAVILABLE);
			}
			catch(error:Error) { trace(instance + " " + error.toString()); }
			
			return "";
		}
		
		/**
		 * Gets <code>navigator.appName</code> from JavaScript. 
		 *  
		 * @return The app name string.
		 * 
		 */
		public static function appName():String
		{
			try
			{
				if(ExternalInterface.available)
				{
					return ExternalInterface.call(GET_APP_NAME);
				}
				else trace(EXTERNALINTERFACE_UNAVILABLE);
			}
			catch(error:Error) { trace(instance + " " + error.toString()); }
			
			return "";
		}
		
		/**
		 * Checks whether browser is Google Chrome or not.
		 *  
		 * @return True is Chrome, otherwise false. 
		 * 
		 */
		public static function isChrome():Boolean
		{
			return isBrowser(CHROME);
		}
		
		/**
		 * Checks whether browser is Apple Safari or not.
		 *  
		 * @return True is Safari, otherwise false. 
		 * 
		 */
		public static function isSafari():Boolean
		{	
			return isBrowser(SAFARI);
		}
		
		/**
		 * Checks whether browser is Opera or not.
		 *  
		 * @return True is Opera, otherwise false. 
		 * 
		 */
		public static function isOpera():Boolean
		{	
			return isBrowser(OPERA);
		}
		
		/**
		 * Checks whether browser is Internet Explorer or not.
		 *  
		 * @return True is Internet Explorer, otherwise false. 
		 * 
		 */
		public static function isMSIE():Boolean
		{
			return isBrowser(MSIE);
		}
		
		/**
		 * Checks whether browser is Mozilla Firefox or not.
		 *  
		 * @return True is Firefox, otherwise false. 
		 * 
		 */
		public static function isFirefox():Boolean
		{
			return isBrowser(FIREFOX);
		}
		
		/**
		 * Checks whether browser is Mozilla SeaMonkey or not.
		 *  
		 * @return True is SeaMonkey, otherwise false. 
		 * 
		 */
		public static function isSeaMonkey():Boolean
		{
			return isBrowser(SEAMONKEY);
		}
		
		/**
		 * Adds a browser string to the browser list. This function is everytime 
		 * <code>isBrowser</code> is run so it can check an updated list of browser strings.
		 *  
		 * @param browser The browser string to be added to the browser name array. 
		 * 
		 * @see #isBrowser()
		 * 
		 */		
		public static function addBrowserName(browser:String):void
		{
			if(BROWSER_NAMES.indexOf(browser) == -1) BROWSER_NAMES.push(browser);
		}
		
		/**
		 * Makes a shallow copy of the browser strings that are being used for browser detection.
		 *  
		 * @return A copy of the browser names in the array.
		 * 
		 */		
		public static function getBrowserNames():Array
		{
			return BROWSER_NAMES.slice();
		}
	}
}