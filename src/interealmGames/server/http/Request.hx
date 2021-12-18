package interealmGames.server.http;

/**
 * Represents an HTTP request hitting the server
 */
interface Request 
{
	/**
	 * Returns the POST Data sent with this request
	 */
	public function getData():String;
	
	/**
	 * Gets cookie value
	 * @param	name
	 * @return
	 */
	public function getCookie(name:String):String;
	
	/**
	 * Gets header value
	 * @param	name
	 * @return
	 */
	public function getHeader(name:String):Array<String>;
	
	/**
	 * Gets a Query String value by the argument name
	 * @param	name
	 * @return
	 */
	public function getParam(name:String):Null<String>;
	
	/**
	 * Gets a named value from the path
	 * ie. path = '/path/to/{name}/'
	 * 
	 * @param	name
	 * @return
	 */
	public function getPathArgument(name:String):Null<String>;
	
	/**
	 * Gets the Request Method
	 * @return
	 */
	public function getType():RequestType;
	
	/**
	 * Not sure what I meant by this.
	 * @return
	 */
	public function getUrl():String;
	
	/**
	 * Sets a header for response
	 * @param	name
	 * @param	value
	 * @param	append
	 */
	public function setHeader(name:String, value:String, ?append:Bool):Void;
	
	/**
	 * Sets a cookie for response
	 * @param	name
	 * @param	value
	 * @param	options
	 */
	public function setCookie(name:String, value:String, ?options:CookieOptions):Void;
}
