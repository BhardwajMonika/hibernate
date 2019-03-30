<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page
	import="org.hibernate.*,
	org.hibernate.cfg.Configuration,
	java.util.*,
	com.niit.hiber.Employee100,
	java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hibrenate collection Mapping Demo</title>
</head>
<body>

<%
Session sess = new Configuration().configure("hibernate.cfg.xml")
.buildSessionFactory().openSession();
Transaction t = sess.beginTransaction();

Employee100 employee = new Employee100();
employee.setEmployeeName("Monika");
Set<String> phoneNumbers = new HashSet<String>();
phoneNumbers.add("999999");
phoneNumbers.add("345123");
phoneNumbers.add("555882");
employee.setPhoneNumber(phoneNumbers);
sess.save(employee);
t.commit();

Query query = sess.createQuery("from Employee100");
List<Employee100> list = query.list();

Iterator<Employee100> itr = list.iterator();
while(itr.hasNext()){
	Employee100 emp = itr.next();
	out.println("Employee Name: "+emp.getEmployeeName());
	
	//printing answers
	Set<String> set = emp.getPhoneNumber();
	Iterator<String> itr2 = set.iterator();
	while(itr2.hasNext()){
		out.println(itr2.next());
	}
	out.println("<br>");
}
sess.close();
out.println("success");
%>
</body>
</html>