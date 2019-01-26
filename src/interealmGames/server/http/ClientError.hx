package interealmGames.server.http;

import interealmGames.server.http.Error;
/**
 * Utility functions creating an Error for Client Errors
 */
class ClientError 
{
	static var BAD_REQUEST = 0;
	static var UNAUTHORIZED = 1;
	static var FORBIDDEN = 3;
	//static var NOT_ACCEPTABLE = 6; // should be handled by server JSON only
	static var CONFLICT = 9;
	static var GONE = 10;
	static var IM_A_TEAPOT = 18;
	
	static function create(subStatus:Int, message:String) {
		return new Error(400 + subStatus, message);
	}
	
	static public function badRequest(message:String) {
		return ClientError.create(ClientError.BAD_REQUEST, message);
	}
	
	static public function unauthorized(?message:String) {
		return ClientError.create(ClientError.UNAUTHORIZED, message == null ? "" : message);
	}
	
	static public function forbidden(?message:String) {
		return ClientError.create(ClientError.FORBIDDEN, message == null ? "" : message);
	}
	
	static public function conflict(message:String) {
		return ClientError.create(ClientError.CONFLICT, message);
	}
	
	static public function gone() {
		return ClientError.create(ClientError.GONE, "");
	}
	
	static public function amTeapot(?teapotRelatedMessage:String) {
		return ClientError.create(ClientError.IM_A_TEAPOT, message == null ? "BOW DOWN BEFORE YOUR TEAPOT MASTER!!" : message);
	}
}