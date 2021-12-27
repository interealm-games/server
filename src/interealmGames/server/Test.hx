package interealmGames.server;

import interealmGames.server.http.test.RequestTest;
import interealmGames.server.http.test.ServerTest;
import utest.Runner;
import utest.ui.Report;

/**
 * All tests for this package
 */
class Test {
	public static function main() {
		var runner:Runner = new Runner();
		runner.addCase(new RequestTest());
		runner.addCase(new ServerTest());
		Report.create(runner);
		runner.run();
	}
}

