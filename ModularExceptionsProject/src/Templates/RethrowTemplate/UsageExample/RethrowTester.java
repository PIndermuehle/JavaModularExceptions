package Templates.RethrowTemplate.UsageExample;

public class RethrowTester {

	static void testThrowHandling() throws Exception {
		throw new Exception();
	}
	
	static public void main(String[] args) throws Exception {
		testThrowHandling();
	}

}
