package interealmGames.server.http;

/**
 * 
 */
interface RequestHandler
{
	public function getPath():String; 
	public function getHandler():Request -> Any;
}