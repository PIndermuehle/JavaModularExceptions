package StudentDataBaseExample.DatabaseCancelExample;

import StudentDataBaseExample.*;

public aspect DatabaseCancelAspect {

	pointcut methodsToCancelExceptions():
		(
		call (void *.StudentDatabase.renameStudent(Student,String,String))
		||
		call (void *.StudentDatabase.addNewStudent(Student))
		)
		&& 
		withincode(void *.StudentDatabaseTestCancel.main(String[] ))
	;
	
	void around(): methodsToCancelExceptions(){
		try{
			proceed();
		}catch(Exception e){
		}
		
	}
}
