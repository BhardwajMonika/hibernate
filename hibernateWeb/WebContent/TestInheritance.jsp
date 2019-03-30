<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page
	import="org.hibernate.*,
	org.hibernate.cfg.Configuration,
	java.util.*,
	com.niit.hiber.Person1,
	com.niit.hiber.Employee1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inheritance Mapping Example</title>
</head>
<body>

	<%
	Configuration cfg = new Configuration();
	cfg.configure("hibernate.cfg.xml");

	SessionFactory sf = cfg.buildSessionFactory();
	Session sess = sf.openSession();
	sess.beginTransaction();
	
	Person1 person = new Person1("Monika","Bhardwaj");
	sess.save(person);
	
	Employee1 employee = new Employee1("Priya","Bhardwaj","HR",new Date());
	sess.save(employee);
	out.println("Executed Successfully");
	sess.getTransaction().commit();
	sess.close();
	%>

</body>
</html>