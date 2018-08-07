package Templates.ReturnDefaultTemplate;

public aspect ReturnDefaultTemplate {
	
	/*
	 * This pointcut and advice handle methods that return Float.
	 */
	pointcut affectedFloatMethods():
		/*
		 * Insert your method here
		 */
		withincode (* *.YourClass.YourMethod(..))
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
	
	/*
	 * This pointcut and advice handle methods that return a String.
	 */
	pointcut affectedStringMethods():
		/*
		 * Insert your method here
		 */
		withincode (* *.YourClass.YourMethod(..))
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