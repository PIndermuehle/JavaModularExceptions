import java.io.File;

import org.apache.bcel.classfile.ClassParser;
import org.apache.bcel.classfile.JavaClass;
import org.apache.bcel.classfile.Method;
import org.apache.bcel.generic.ConstantPoolGen;
import org.apache.bcel.generic.InstructionList;
import org.apache.bcel.generic.MethodGen;


public class TestSubject {

	
	static public void staticDostuff(){
		System.out.println("This is a test print");
	}
	
	static public void testMethod(){
		System.out.println("SUCCESS");
	}
	
	public void doStuff(){
		
		System.out.println("TestSubject says hello");
	}
	
	public static void main(String[] argv) throws Exception {
		int myCase = 1;
		 
		TestSubject.staticDostuff();
		
		/*
		switch(myCase) {
			case 1:{
				TestSubject.staticDostuff();
				break;
			}
			
			case 2:{
				
				String s = System.getProperty("user.dir")+File.separator+"bin"+File.separator+"TestSubject.class";
				JavaClass java_class = new ClassParser(s).parse();
				Method[] methods = java_class.getMethods();
				ConstantPoolGen cp = new ConstantPoolGen(java_class.getConstantPool());
				
				
				for (int j = 0; j < methods.length; j++) {
					MethodGen mg = new MethodGen(methods[j], java_class.getClassName(), cp);
					InstructionList il = mg.getInstructionList();

					System.out.println(mg);
					System.out.println(il);
				}
				
				
				break;
			}
			
		};
		*/
		
	}
	
	
}
