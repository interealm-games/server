package interealmGames.server.http;

import interealmGames.server.http.Error;
/**
 * Utility functions creating an Error for various redirects
 */
class Redirect 
{
	static var MOVED_PERMANENTLY = 1;
	static var TEMPRORAY_REDIRECT = 7;
	static var PERMANENT_REDIRECT = 8;
	
	static function create(subStatus:Int, message:String) {
		return new Error(300 + subStatus, message);
	}
	
	static public function movedPermanently (newUrl:String) {
		return Redirect.create(Redirect.MOVED_PERMANENTLY, newUrl);
	}
	
	static public function temporary (newUrl:String) {
		return Redirect.create(Redirect.TEMPRORAY_REDIRECT, newUrl);
	}
	
	static public function permanent (newUrl:String) {
		return Redirect.create(Redirect.PERMANENT_REDIRECT, newUrl);
	}
}