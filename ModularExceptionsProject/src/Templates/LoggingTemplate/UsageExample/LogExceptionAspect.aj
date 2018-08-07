package Templates.LoggingTemplate.UsageExample;

import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;

public aspect LogExceptionAspect {

	
	/*
	 * Insert methods to be affected here
	 */
	pointcut affectedMethods(Exception e):
		withincode(void LogExceptionTester.main(String[]) )
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
