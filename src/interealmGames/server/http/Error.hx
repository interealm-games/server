package interealmGames.server.http;

/**
 * Represents an api issue with a request
 */
class Error 
{
	/** HTTP Status Code */
	public var status:Int;
	/**  */
	public var message:String;
	
	public function new(status:Int, message:String) 
	{
		this.status = status;
		this.message = message;
	}
}