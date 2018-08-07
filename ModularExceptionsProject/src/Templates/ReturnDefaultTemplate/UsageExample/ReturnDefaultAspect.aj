package Templates.ReturnDefaultTemplate.UsageExample;

public aspect ReturnDefaultAspect {
	
	pointcut affectedFloatMethods():
		withincode (void ReturnDefaultTester.main(String[]))
		&&
		call(float *(..))
	;

	float around():affectedFloatMethods(){
		try{
			return proceed();
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	pointcut affectedStringMethods():
		withincode (void ReturnDefaultTester.main(String[]))
		&&
		call(String *(..))
	;

	String around():affectedStringMethods(){
		try{
			return proceed();
		}catch(Exception e){
			e.printStackTrace();
			return "";
		}
	}
	
	
}