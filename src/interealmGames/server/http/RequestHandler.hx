package interealmGames.server.http;

/**
 * 
 */
typedef RequestHandler = 
{
	/**
	 * Handler for the request
	 */
	var handler:Request -> Any;
	
	/**
	 * The relative API path
	 */
	var path:String; 
	
	/**
	 * The Request Method
	 */
	var type:RequestType;
}