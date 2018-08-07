package StudentDataBaseExample.DatabaseReturnExample;

import StudentDataBaseExample.*;

public aspect DatabaseReturnAspect {
	
	pointcut methodReturnDefaultString():
		(
		call (String StudentDataBaseExample.Student.getName())
		||
		call (String StudentDataBaseExample.Student.getLastname())
		)
	;

	String around(): methodReturnDefaultString(){
		try {
			return proceed();
		} catch (Exception e) {
			return "";
		}

	}

}
