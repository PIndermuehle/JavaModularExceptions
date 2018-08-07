package Templates.RethrowTemplate.UsageExample;

public aspect RethrowAspect {
	
	pointcut affectedMethods():
		withincode (void RethrowTester.main(String[]))
		&&
		call(void *(..))
	;

	void around() throws Exception:affectedMethods(){
		try{
			proceed();
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
}