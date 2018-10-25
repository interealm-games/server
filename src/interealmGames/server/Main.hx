package interealmGames.server;

import interealmGames.server.http.Request;
import interealmGames.server.http.RequestHandler;
import interealmGames.server.http.RequestType;
import php.Lib;

/**
 * ...
 * @author dmcblue
 */
class Main 
{

	static function main() 
	{
		var handler = {
			type: RequestType.DELETE,
			path: "http://www.google.com",
			handler: function(request:Request) {
				trace(request.getType().getName());
				return null;
			}
		};
		trace(handler.path);
	}

}