package interealmGames.server.http;

/**
 * 
 */
typedef RequestHandler =
{
	var path:String; 
	var handler:Request -> Any;
}