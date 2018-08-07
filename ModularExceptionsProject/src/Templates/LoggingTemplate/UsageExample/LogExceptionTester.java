package Templates.LoggingTemplate.UsageExample;

public class LogExceptionTester {

	static void testThrowHandling() throws Exception {
		throw new Exception();
	}

	static public void main(String[] args) throws Exception {
		try{
			testThrowHandling();
		}
		catch(Exception e){
			
		}
	}

}
