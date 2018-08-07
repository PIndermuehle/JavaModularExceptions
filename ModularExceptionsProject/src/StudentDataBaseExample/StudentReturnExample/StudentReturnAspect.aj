package StudentDataBaseExample.StudentReturnExample;


public aspect StudentReturnAspect {

	pointcut methodsToReturnDefaultBooleanValue():
		call(boolean *.Student.equals(Object))
	;
	
	boolean around():methodsToReturnDefaultBooleanValue(){
		try{
			return proceed();
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
}
