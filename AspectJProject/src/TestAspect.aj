public aspect TestAspect {

	/*
	 * This pointcut and its method catch all nullpointer Exceptions
	 * for methods demanding an object
	 */

	/*
	 * 
	 * pointcut tryCatchDoNothing(): (call (void *(*))) ;
	 * 
	 * void around() :tryCatchDoNothing(){ try{ proceed(); }
	 * catch(NullPointerException e){
	 * System.out.println("Exception was cought in aspect: "+e.toString()); } };
	 */

	
	/*
	 * This pointcut prevents nullpointer exceptions through calls to null
	 * objects
	 */

	pointcut preventNullpointer(Object o1):
	call (void *(..)) &&
	target(o1)
;

	void around(Object o1) : preventNullpointer(o1){
		if (o1 != null)
			proceed(o1);
		else
			System.out.println("Nullpointer on target prevented");
		return;
	}

	/*
	 * This pointcut prevents nullpointer errors if the First parameter is null
	 */

	pointcut detectFirstNullParameter(Object o1):
	(call (void *(*,..)) && args(o1,..))
;

	void around(Object o1) :detectFirstNullParameter(o1){
		if (o1 != null)
			proceed(o1);
		else
			System.out.println("The first parameter was null!");
	}

	/*
	 * This pointcut prevents nullpointer errors if the Second parameter is null
	 */
	
	pointcut detectSecondNullParameter(Object o1):
		(call (void *(*,*)) && args(*,o1))
	;

	void around(Object o1) :detectSecondNullParameter(o1){
		if (o1 != null)
			proceed(o1);
		else
			System.out.println("The second parameter was null!");
	}


};
