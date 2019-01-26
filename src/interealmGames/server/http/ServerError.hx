package interealmGames.server.http;

/**
 * Utility functions creating an Error for Server Errors
 */
class ServerError 
{
	static var INTERNAL_SERVER_ERROR = 0;
	
	static function create(subStatus:Int, message:String) {
		return new Error(500 + subStatus, message);
	}
	
	static public function general(?message:String) {
		return ServerError.create(
			ServerError.INTERNAL_SERVER_ERROR, 
			message == null ? "An unknown error occured." : message
		);
	}
	
	static public function thisIsFine() {
		return new Error(218, "This is fine. It's fine. Really. It's fine.");
	}
}