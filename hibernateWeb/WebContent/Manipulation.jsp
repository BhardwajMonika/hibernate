<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page
	import="org.hibernate.*,
	org.hibernate.cfg.Configuration,
	java.util.*,
	com.niit.hiber.User,
	java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DML Operations</title>
</head>
<body>

<h1>HOL DML Operations</h1>
<%
	Configuration cfg = new Configuration();
	cfg.configure("hibernate.cfg.xml");

	SessionFactory sf = cfg.buildSessionFactory();
	Session sess = sf.openSession();
	Transaction t = sess.beginTransaction();

String hql = "update User set email = :email where id = :id";

Query query = sess.createQuery(hql);
query.setParameter("email","swati@gmail.com");
query.setParameter("id",10);

int rowsAffected = query.executeUpdate();
if(rowsAffected > 0){
	out.println("Updated "+rowsAffected+" rows.");
} 
String hql1 = "delete from User where id = :id";
 
query = sess.createQuery(hql1);
query.setParameter("id",new Integer(3));

rowsAffected = query.executeUpdate();
if(rowsAffected > 0){
	out.println("Deleted "+ rowsAffected + " rows.");
	}
t.commit();
sess.close();
sf.close();
%>

</body>
</html>