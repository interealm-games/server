package interealmGames.server;

import interealmGames.server.http.Request;
import interealmGames.server.http.RequestHandler;
import interealmGames.server.http.RequestType;
import php.Lib;

class RH implements RequestHandler {
	public function new(){}
	
	public function getType() {
		return RequestType.DELETE;
	}
	
	public function getPath() {
		return "http://www.google.com";
	}
	
	public function getHandler() {
		return function(request:Request) {
			trace(request.getType().getName());
			return null;
		};
	}
}
/**
 * ...
 * @author dmcblue
 */
class Main 
{

	static function main() 
	{
		var handler:RH = new RH();
		trace(handler.getPath());
	}

}