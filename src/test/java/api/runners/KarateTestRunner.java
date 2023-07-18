package api.runners;

import com.intuit.karate.junit5.Karate;

public class KarateTestRunner {

	@Karate.Test
	Karate testSystemProperty() {
		return Karate.run("classpath:features").tags("Test");
	}

}
