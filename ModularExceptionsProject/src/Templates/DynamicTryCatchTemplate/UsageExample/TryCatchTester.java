package Templates.DynamicTryCatchTemplate.UsageExample;

public class TryCatchTester {

	static void testThrowHandling() throws Exception {
		throw new Exception();
	}
	
	static public void main(String[] args) throws Exception {
		testThrowHandling();
	}

}
