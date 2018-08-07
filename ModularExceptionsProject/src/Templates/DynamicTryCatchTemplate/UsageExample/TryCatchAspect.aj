package Templates.DynamicTryCatchTemplate.UsageExample;

public aspect TryCatchAspect {
	
	pointcut affectedMethods():
		withincode (void TryCatchTester.main(String[]))
		&&
		call(void *(..))
	;

	void around():affectedMethods(){
		try{
			proceed();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}