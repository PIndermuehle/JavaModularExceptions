package ModularException;

import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;

public aspect ExceptionLoggingAspect {

	boolean logActivity = true;

	/*
	 * Include all methods whose exceptions you want to have logged instead of
	 * thrown with the "within" command
	 */
	pointcut affectedMethods():
		withincode(* TestSubjects.LogExceptionTester.testThrowHandling(..) )
		 
	;

	/*
	 * This pointcut includes the affectedMethods() pointcut and handles getting
	 * the data and excluding the PrintStream class so that log printing is not
	 * affected by our pointcut
	 */
	pointcut logExceptionsDoNotThrow(Exception e):
		!call(void java.io.PrintStream.*(..))
		&& 
			(
			 affectedMethods()
			 ||
			 within(ModularException.TryCatchAspect)
				
			)
		&& handler(*) 
		&& args(e)
		;

	/*
	 * This advice prints the exception that was thrown and caught
	 */
	before(Exception e) : logExceptionsDoNotThrow(e){

		System.out
				.println("Cought an exception in the aspect 'logExceptionsDoNotThrow', printing stack trace:");
		e.printStackTrace();

	}

}
