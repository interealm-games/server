package interealmGames.server.http.test;

import interealmGames.common.ArrayTools;
import interealmGames.server.http.ClientError;
import interealmGames.server.http.RequestHandler;
import interealmGames.server.http.test.Request;

using StringTools;

class Server {
	public var requestHandlers:Array<RequestHandler>;
	public function new(requestHandlers:Array<RequestHandler>) {
		this.requestHandlers = requestHandlers;
	}

	public function handle(request:Request) {
		var type = request.getType();
		var url = request.getUrl();
		var handler:RequestHandler = ArrayTools.select(this.requestHandlers, function(handler:RequestHandler) {
			return handler.type == type &&
					this.matchUrl(
						url,
						handler.path
					);
		});

		if (handler == null) {
			throw ClientError.notFound();
		}

		request.handler = handler;

		return handler.handler(request);
	}

	public function matchUrl(requestUrl:String, handlerUrl:String):Bool  {
		var requestParts = requestUrl.split('/').filter(function(str:String) { return str.length > 0; });
		var handlerParts = handlerUrl.replace('[/]','').split('/').filter(function(str:String) { return str.length > 0; });

		if (requestParts.length != handlerParts.length) {
			return false;
		}

		for(i in 0...requestParts.length) {
			var value = handlerParts[i]; 
			if (value.length == 0 || !(value.charAt(0) == '{' && value.charAt(value.length - 1) == '}')) {
				if(requestParts[i] != handlerParts[i]) {
					return false;
				}
			}
		}

		return true;
	}
}
