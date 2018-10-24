package interealmGames.server;

import interealmGames.server.http.Request;
import interealmGames.server.http.RequestHandler;
import php.Lib;

class RH implements RequestHandler {
	public function new(){}
	
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