package TestSubjects;

import ModularException.AspectBackrollable;
import ModularException.BackrollableException;

public class RollbackTester implements AspectBackrollable {

	float aValue1 = 2;
	float rollbackValue1 = 2;
	float aValue2 = 2;
	float rollbackValue2 = 2;
	
	@Override
	public void makeRollbackPoint() {
		rollbackValue1 = aValue1;
		rollbackValue2 = aValue2;
	}
	
	public void makeRollbackPoint(float startValue1, float startValue2) {
		aValue1 = startValue1;
		aValue2 = startValue2;
		rollbackValue1 = startValue1;
		rollbackValue2 = startValue2;
	}
	
	@Override
	public void rollbackToLastPoint() {
		aValue1 = rollbackValue1;
		aValue2 = rollbackValue2;
	}
	
	void setValue1(float newValue){
		aValue1 = newValue;
		
	}
	
	void setValue2(float newValue) throws BackrollableException{
		if (newValue < 0) {
			Object[] o = {(Object)this} ;
			throw new BackrollableException(o);
		}
		
		aValue2 = newValue;
		
	}
	
	float getValue2(){
		return aValue2;
	}
	
	float getValue1(){
		return aValue1;
	}
	
	static void manipulateRollbackTester(RollbackTester tester, float newValue1, float newValue2){
		try {
			tester.setValue1(newValue1);
			tester.setValue2(newValue2);
		} catch (BackrollableException e) {}
		
	}
	
	void setValues (float newValue1, float newValue2){
		setValue1(newValue1);
		try {
			setValue2(newValue2);
		} catch (BackrollableException e) {
		}
		
	}
	
	public String toString(){
		return "RollbackTester with values: "+aValue1+" and : "+aValue2;
	}
	
	static public void main(String[] args){
		
		RollbackTester tester1 = new RollbackTester();
		
		manipulateRollbackTester(tester1, 1 ,4);
		
		manipulateRollbackTester(tester1, 2 ,-2);
		
		System.out.println(tester1);
		
		manipulateRollbackTester(tester1, 3 ,6);
		
		System.out.println(tester1);
		
		tester1.setValues(0,-5);
		
	}

	
	
	
	
}
