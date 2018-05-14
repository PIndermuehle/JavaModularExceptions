
public class TestSubject_hello {

	
	static public void staticDostuff(){
		
		System.out.println("TestSubject says hello");
		
	}
	
	public void doStuff(){
		
		System.out.println("TestSubject says hello");
	}
	
	public static void main(String[] argv) throws Exception {
		
		//TestSubject.staticDostuff();
		
		new TestSubject_hello().doStuff();
		
	}
	
	
}
