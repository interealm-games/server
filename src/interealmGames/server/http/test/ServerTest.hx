package interealmGames.server.http.test;

import interealmGames.server.http.test.Server;
import utest.Assert;
import utest.Async;
import utest.Test;

typedef MatchUrlTest = {
	var requested:String;
	var handler:String;
	var match:Bool;
}

class ServerTest extends Test 
{
	public function testMatchUrl() {
		var tests:Array<MatchUrlTest> = [{
			requested: "/join/1234",
			handler: "/join/{id}[/]",
			match: true
		}];

		var server = new Server([]);
		for(test in tests) {
			Assert.equals(test.match, server.matchUrl(test.requested, test.handler));
		}
	}
}


