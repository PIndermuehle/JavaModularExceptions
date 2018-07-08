package TestSubjects;

import java.io.IOException;

public class LogExceptionTester {

	
static void testThrowHandling() throws Exception{
		
		throw new IOException();
		
		
	}
	
	
	
	static public void main(String[] args) throws Exception{
		
		testThrowHandling();
		
		
	}
	
	
	
}
