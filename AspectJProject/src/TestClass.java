import java.awt.Color;
import java.io.PrintStream;


public class TestClass {

	
	interface myLambda{
		
		String dostuff();
		
	}
	
	public void doNothing(){
		
	}
	
	static public void voidObj1 (Object o1){
		System.out.println(o1.toString());
	}
	
	static public void voidCol1 (Color o1){
		System.out.println(o1.toString());
	}
	
	static public void voidColCol1 (Color o1, Color o2){
		System.out.println(o1.toString() + o2.toString());
	}
	
	static public float floatCol1 (Color o1){
		System.out.println(o1.toString());
		return o1.getRed();
	}
	
	static public float floatColCol1 (Color o1, Color o2){
		System.out.println(o1.toString());
		System.out.println(o2.toString());
		return o1.getRed() + o2.getRed();
	}
	
	static public void main(String[] args){
		
		myLambda mylab = ()->"A lambda result";
		// test out a series of nullpointer errors
		Color s = new Color(200);
		// Two calls with null parameters
		voidObj1(null);
		voidCol1(null);
		
		// a call to a null object
		
		TestClass c = null;
		c.doNothing();
		
		
		voidColCol1(null,null);
		voidColCol1(s,null);
		
	
		
		
				
	}
	
	
	
}
