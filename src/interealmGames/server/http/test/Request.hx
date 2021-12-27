package interealmGames.server.http.test;

import interealmGames.server.http.CookieOptions;
import interealmGames.server.http.RequestHandler;
import interealmGames.server.http.RequestType;
import interealmGames.server.http.Request as Interface;

using StringTools;

typedef RequestParams = {
	?data:String,
	type:RequestType,
	url:String,
	?cookies:Map<String,String>,
	?headers:Map<String,Array<String>>,
	?params:Map<String,Null<String>>
}

class Request implements Interface {
	public var url:String;
	public var type:RequestType;
	public var data:String = "";
	public var cookies:Map<String,String> = new Map();
	public var headers:Map<String,Array<String>> = new Map();
	public var params:Map<String,Null<String>> = new Map();
	public var handler:RequestHandler;
	public function new(params:RequestParams) {
		this.url = params.url;
		this.type = params.type;
		if(Reflect.hasField(params, 'data')) {
			this.data = Reflect.field(params, 'data');
		}
		if(Reflect.hasField(params, 'cookies')) {
			this.cookies = Reflect.field(params, 'cookies');
		}
		if(Reflect.hasField(params, 'headers')) {
			this.headers = Reflect.field(params, 'headers');
		}
		if(Reflect.hasField(params, 'params')) {
			this.params = Reflect.field(params, 'params');
		}	
	}
	/**
	 * Returns the POST Data sent with this request
	 */
	public function getData():String {
		return this.data;
	}
	
	/**
	 * Gets cookie value
	 * @param	name
	 * @return
	 */
	public function getCookie(name:String):String {
		return this.cookies.get(name);
	}
	
	/**
	 * Gets header value
	 * @param	name
	 * @return
	 */
	public function getHeader(name:String):Array<String> {
		return this.headers.get(name);
	}
	
	/**
	 * Gets a Query String value by the argument name
	 * @param	name
	 * @return
	 */
	public function getParam(name:String):Null<String> {
		return this.params.get(name);
	}
	
	/**
	 * Gets a named value from the path
	 * ie. path = '/path/to/{name}/'
	 * 
	 * @param	name
	 * @return
	 */
	public function getPathArgument(name:String):Null<String> {
		var requestParts = this.url.split('/');
		var handlerParts = this.handler.path.replace('[/]','').split('/');

		for(i in 0...requestParts.length) {
			var value = handlerParts[i];
			if (value.charAt(0) == '{' && value.charAt(value.length - 1) == '}') {
				if (name == handlerParts[i].substring(1, value.length - 1)) {
					return requestParts[i];
				}
			}
		}

		return null;
	}
	
	/**
	 * Gets the Request Method
	 * @return
	 */
	public function getType():RequestType {
		return this.type;
	}
	
	/**
	 * Not sure what I meant by this.
	 * @return
	 */
	public function getUrl():String {
		return this.url;
	}
	
	/**
	 * Sets a header for response
	 * @param	name
	 * @param	value
	 * @param	append
	 */
	public function setHeader(name:String, value:String, ?append:Bool):Void {
		var values = [];
		if(this.headers.exists(name)) {
			values = this.headers.get(name);
		}
		values.push(value);
		this.headers.set(name, values);
	}
	
	/**
	 * Sets a cookie for response
	 * @param	name
	 * @param	value
	 * @param	options
	 */
	public function setCookie(name:String, value:String, ?options:CookieOptions):Void {
		this.cookies.set(name, value);
	}
}
