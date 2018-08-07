package StudentDataBaseExample;

import java.util.ArrayList;

public class StudentDatabase {

	private ArrayList<Student> students = new ArrayList<Student>();

	public void addNewStudent(Student newStudent) throws Exception {
		if (doesStudentExist(newStudent.getName(), newStudent.getLastname()))
			throw new Exception("Student " + newStudent.getName()
					+ " already exists");
		students.add(newStudent);
	}

	public void renameStudent(Student student, String newStudentName,
			String newStudentLastName) throws Exception {

		// Check if the student with the new names would conflict with the
		// database
		if (doesStudentExist(newStudentName, newStudentLastName))
			throw new Exception("Student " + newStudentName + " already exists");

		student.setName(newStudentName);
		student.setLastname(newStudentLastName);
	}

	public Student getStudentByNameAndLastname(String name, String lastname) {
		for (Student item : students) {
			if (item.getName() == name && item.getLastname() == lastname)
				return item;
		}
		return null;
	}

	boolean doesStudentExist(String studentFirstName, String studentLastName) {
		return this.getStudentByNameAndLastname(studentFirstName,
				studentLastName) != null;
	}

}
