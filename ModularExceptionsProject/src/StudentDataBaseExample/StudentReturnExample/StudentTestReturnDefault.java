package StudentDataBaseExample.StudentReturnExample;

import StudentDataBaseExample.Student;

public class StudentTestReturnDefault {

	public static void main(String[] args){
		
		Student student = new Student("Alex", "Spencer");
		assert ! student.equals(null);
		assert ! student.equals(new Object());
		assert student.equals(student);
		assert student.equals(new Student("Alex", "Spencer"));
		
		
	}
	
	
	
}
