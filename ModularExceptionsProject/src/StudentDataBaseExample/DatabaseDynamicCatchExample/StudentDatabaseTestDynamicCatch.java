package StudentDataBaseExample.DatabaseDynamicCatchExample;

import StudentDataBaseExample.Student;
import StudentDataBaseExample.StudentDatabase;

public class StudentDatabaseTestDynamicCatch {

	public static void main(String[] args) throws Exception{
		
		StudentDatabase DB = new StudentDatabase();
		DB.addNewStudent(new Student("Tom", "Knott") );
		DB.addNewStudent(new Student("Tom", "Knott") );
		
		Student alexSpencer = new Student("Alex", "Spencer");
		DB.addNewStudent(alexSpencer);
		DB.renameStudent(alexSpencer,"Tom","Knott" );
		
		//This should cause a "Student already exists" Exception
		
	}
	
	
	
}
