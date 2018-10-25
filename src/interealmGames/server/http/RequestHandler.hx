package interealmGames.server.http;

/**
 * 
 */
interface RequestHandler
{
	/**
	 * Gets a handler for the request
	 * @return
	 */
	public function getHandler():Request -> Any;
	
	/**
	 * The relative API path
	 * @return
	 */
	public function getPath():String; 
	
	/**
	 * Gets the Request Method
	 * @return
	 */
	public function getType():RequestType;
}