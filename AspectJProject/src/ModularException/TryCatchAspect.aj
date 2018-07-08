package ModularException;

public aspect TryCatchAspect {

	boolean logActivity = true;

	/*
	 * Include all methods that you wish to wrap into a dynamic try catch block
	 * Note that all methods that throw an exception must still be caught by a
	 * hardcoded try catch block or the method must be declared to throw an
	 * exception. Otherwise the compiler will not compile your method
	 */
	pointcut tryCatchPointcut():
			call(void TestSubjects.LogExceptionTester.*(..))
		;

	void around():tryCatchPointcut(){
		try {
			proceed();
		} catch (BackrollableException e) {
			if (logActivity)
				System.out.println("Entering a dynamic catch block");
		} catch (Exception e) {
			if (logActivity)
				System.out.println("Entering a dynamic catch block");
		}

	}

}
