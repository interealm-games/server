package interealmGames.server.http.test;

import interealmGames.server.http.test.Request;
import interealmGames.server.http.Request in RequestDef;
import interealmGames.server.http.RequestHandler;
import interealmGames.server.http.RequestType;
import interealmGames.server.http.test.Server;
import utest.Assert;
import utest.Async;
import utest.Test;

typedef GetPathArgumentTest = {
	var requested:String;
	var handler:String;
	var field:String;
	var value:String;
}

// class TestHandler implements RequestHandler {
// 	public var path:String;
// 	public var type:RequestType = RequestType.GET;

// 	public function new(path) {
// 		this.path = path;
// 	}

// 	public function handler(request:Request):Any {
// 		return null;
// 	}
// }

class RequestTest extends Test 
{
	public function testGetPathArgument() {
		var tests:Array<GetPathArgumentTest> = [{
			requested: "/join/1234",
			handler: "/join/{id}[/]",
			field: "id",
			value: "1234"
		}, {
			requested: "/join/1234/",
			handler: "/join/{id}[/]",
			field: "id",
			value: "1234"
		}];

		var server = new Server([]);
		for(test in tests) {
			var handler:RequestHandler = {
				type: RequestType.GET,
				path: test.handler,
				handler: function (request:RequestDef) {
					return null;
				}
			};
			var request = new Request({
				type: RequestType.GET,
				url: test.requested
			});
			request.handler = handler;
			Assert.equals(test.value, request.getPathArgument(test.field));
		}
	}
}


