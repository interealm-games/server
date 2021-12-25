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

		return handler.handler(request);
	}

	public function matchUrl(requestUrl:String, handlerUrl:String):Bool  {
		var requestParts = requestUrl.split('/');
		var handlerParts = handlerUrl.replace('[/]','').split('/');

		if (requestParts.length != handlerParts.length) {
			return false;
		}

		for(i in 0...requestParts.length) {
			if (handlerParts[i].length == 0 || handlerParts[i].charAt(0) != ':') {
				if(requestParts[i] != handlerParts[i]) {
					return false;
				}
			}
		}

		return true;
	}
}
