package Templates.RethrowTemplate;

public aspect RethrowTemplate {
	
	/*
	 * This pointcut and advice handle methods that return Float.
	 */
	pointcut affectedMethods():
		/*
		 * Insert your method here
		 */
		withincode (* *.YourClass.YourMethod(..))
		&&
		call(void *(..))
	;

	void around() throws Exception:affectedMethods(){
		try{
			proceed();
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
}