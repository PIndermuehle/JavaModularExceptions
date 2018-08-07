package Templates.LoggingTemplate;

public aspect LogExceptionTemplate {

	
	/*
	 * Insert methods to be affected here
	 */
	pointcut affectedMethods(Exception e):
		/*
		 * Insert your method here
		 */
		withincode(* *.YourClass.YourMethod(..) )
		&&
		handler(Exception)
		&&
		args(e)
	;

	/*
	 * This catches exceptions and prints them instead
	 */
	before(Exception e): affectedMethods(e){
		e.printStackTrace();
	}
}
