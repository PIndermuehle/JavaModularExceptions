package Templates.ReturnDefaultTemplate.UsageExample;

public class ReturnDefaultTester {

	static float throwExceptionFloatReturn() throws Exception {
		throw new Exception();
	}
	
	static String throwExceptionStringReturn() throws Exception {
		throw new Exception();
	}

	static public void main(String[] args) throws Exception {
		assert throwExceptionFloatReturn()==0;
		assert throwExceptionStringReturn()=="";
	}

}
