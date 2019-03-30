<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ page
	import="org.hibernate.*,
	org.hibernate.cfg.Configuration,
	java.util.*,
	com.niit.hiber.Student,
	com.niit.hiber.StudentClass"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Component Mapping Example</title>
</head>
<body>

	<%
	Session sess = new Configuration().configure("hibernate.cfg.xml")
	.buildSessionFactory().openSession();
	Transaction t = sess.beginTransaction();

	StudentClass studentClass = new StudentClass("HR2","BE2");
	Student student = new Student("Priya","Sharma","BE/02/15",27,studentClass);
	sess.save(student); //saved as persistent object.
	t.commit();
	
	t = sess.beginTransaction();
	List<Student> students = sess.createQuery("from Student").list();
	for(Student student1 : students)
	{
		out.println("First Name :"+student1.getFirstName()+"<br>");
		out.println("Last Name :"+student1.getLastName()+"<br>");
		out.println("RollNo :"+student1.getRollNo()+"<br>");
		out.println("Age :"+student1.getAge()+"<br>");
		
		StudentClass studentClass1 = student.getStudentClass();
		out.println("Class Name :" +studentClass1.getClassName()+"<br>");
		out.println("Class Id : "+studentClass.getClassId()+"<br>");
	}
	out.println("<br>");
	t.commit();
	sess.close();
	
	%>

</body>
</html>