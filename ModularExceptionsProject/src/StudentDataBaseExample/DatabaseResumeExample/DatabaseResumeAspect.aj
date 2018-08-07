package StudentDataBaseExample.DatabaseResumeExample;


public aspect DatabaseResumeAspect {
	
	pointcut methodResumeString():
		withincode(void StudentDatabaseTestResume.main(String[]))
		&&
		call (void *(..))
		
	;

	void around(): methodResumeString(){
		try {
			proceed();
		} catch (Exception e) {
			
		}

	}

}
