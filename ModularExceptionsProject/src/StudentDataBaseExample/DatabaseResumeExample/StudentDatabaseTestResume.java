package StudentDataBaseExample.DatabaseResumeExample;

import StudentDataBaseExample.Student;
import StudentDataBaseExample.StudentDatabase;

public class StudentDatabaseTestResume {

	public static void main(String[] args) throws Exception{
		
		StudentDatabase DB = new StudentDatabase();
		DB.addNewStudent(null);
		Student alexSpencer = new Student("Alex","Spencer");
		DB.addNewStudent(alexSpencer);
		Student foundStudent = DB.getStudentByNameAndLastname("Alex", "Spencer");
		assert foundStudent == alexSpencer;
		
	}
	
	
	
}
