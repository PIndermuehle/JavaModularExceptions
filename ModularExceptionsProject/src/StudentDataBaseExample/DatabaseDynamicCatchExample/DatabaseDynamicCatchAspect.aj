package StudentDataBaseExample.DatabaseDynamicCatchExample;

import StudentDataBaseExample.*;

public aspect DatabaseDynamicCatchAspect {

	pointcut methodsToCatchExceptions():
		(
		call (void *.StudentDatabase.renameStudent(Student,String,String))
		||
		call (void *.StudentDatabase.addNewStudent(Student))
		)
		&& 
		withincode(void *.StudentDatabaseTestDynamicCatch.main(String[] ))
	;
	
	void around() throws Exception: methodsToCatchExceptions(){
		try{
			proceed();
		}catch(Exception e){
		}
		
	}
}
