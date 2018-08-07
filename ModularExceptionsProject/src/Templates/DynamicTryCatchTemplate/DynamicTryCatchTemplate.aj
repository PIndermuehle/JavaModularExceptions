package Templates.DynamicTryCatchTemplate;

public aspect DynamicTryCatchTemplate {
	
	pointcut affectedMethods():
		/*
		 * Insert your method here
		 */
		withincode (* *.YourClass.YourMethod(..))
		&&
		call(void *(..))
	;

	void around():affectedMethods(){
		try{
			proceed();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
}