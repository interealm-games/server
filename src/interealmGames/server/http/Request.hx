package interealmGames.server.http;

/**
 * Represents an HTTP request hitting the server
 */
interface Request 
{
	public function getType():RequestType;
	
	public function getUrl():String;
	
	public function getParam(name:String):Null<String>;
	
	@:generic public function getData<T>():T;
}