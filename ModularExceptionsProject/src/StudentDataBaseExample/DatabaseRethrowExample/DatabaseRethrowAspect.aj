package StudentDataBaseExample.DatabaseRethrowExample;

import StudentDataBaseExample.*;

public aspect DatabaseRethrowAspect {

	pointcut methodsToRethrowExceptions():
		(
		call (void *.StudentDatabase.renameStudent(Student,String,String))
		||
		call (void *.StudentDatabase.addNewStudent(Student))
		)
		&& 
		withincode(void *.StudentDatabaseTestRethrow.main(String[] ))
	;
	
	void around() throws Exception: methodsToRethrowExceptions(){
		try{
			proceed();
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
	}
}
