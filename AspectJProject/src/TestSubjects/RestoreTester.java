package TestSubjects;

import ModularException.AspectRestorable;
import ModularException.RestorableException;

public class RestoreTester implements AspectRestorable{

	float aValue = 0;
	
	RestoreTester(float value){
		aValue = value;
	}
	
	void setValue(float newValue){
		aValue = newValue;
	}
	
	float getValue(){
		return aValue;
	}
	
	void copyValue(RestoreTester otherTester){
		aValue = otherTester.getValue();
	}
	
	@Override
	public boolean isCorrupt() {
		return aValue<0;
	}
	
	public void saveSetValue(float aValue){
		
		this.aValue = aValue;
		try{
			if(aValue<0){
				Object[] o = {(Object)this};
				throw new RestorableException(o);
			}
			else this.setValue(aValue);
		}catch(RestorableException e){
			
		}
		
	}

	@Override
	public void fixCorruption() {
		aValue = Math.max(aValue, 0);
	}
	
	public String toString(){
		return "RestoreTester with value: "+aValue;
	}

	
	static public void main(String[] args){
		
		RestoreTester tester1 = new RestoreTester(1);
		/*
		tester1.setValue(3);
		
		tester1.setValue(-2);
		
		RestoreTester tester2 = new RestoreTester(-1);
		
		tester1.copyValue(tester2);
		*/
		tester1.saveSetValue(-1);
		
		
	}
	
	
	
}
