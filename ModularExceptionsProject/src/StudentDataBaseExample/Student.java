package StudentDataBaseExample;

public class Student {

	String name;
	String lastname;
	
	public Student(String name, String lastname){
		this.name = name;
		this.lastname = lastname;
	}
	
	String getName(){
		return name;
	}
	
	void setName(String newName){
		name = newName;
	}
	
	String getLastname(){
		return lastname;
	}
	
	void setLastname(String newName){
		lastname = newName;
	}
	
	public boolean equals(Object other){
		Student otherStudent = (Student) other;
		return otherStudent.getName() == this.name && otherStudent.getLastname()==this.lastname;
	}
	
	public String toString(){
		return "Student: " +name +" "+lastname;
	}


	
	static Student defaultStudent(){
		return new Student("Default student", "Default student");
	}
	
	
}
