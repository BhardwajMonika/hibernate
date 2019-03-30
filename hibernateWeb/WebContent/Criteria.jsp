<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="org.hibernate.*,
	org.hibernate.cfg.Configuration,
	java.util.*,
	com.niit.hiber.User,
	org.hibernate.criterion.*,
	java.util.Iterator,
	java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Criteria Object in Hibernate</title>
</head>
<body>

<%

Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");

SessionFactory sf = cfg.buildSessionFactory();
Session sess = sf.openSession();


Criteria cr = sess.createCriteria(User.class);

//TO get records having firstName starting with r
//cr.add(Restrictions.like("name","p%"));
//cr.add(Restrictions.eq("id",5));
cr.addOrder(Order.asc("name"));
cr.setMaxResults(5);

List<User> list = (List<User>) cr.list();
out.println("List of Employees ::"+"<br>");
out.println("<table border='1'>");
out.println("<tr bgcolor='yellow'>");
out.println("<th>User Id</th>");
out.println("<th>User Name</th>");
out.println("<th>Email</th>");
out.println("</tr>");

Iterator it=list.iterator();
while(it.hasNext())
{
	User u=(User)it.next();
	out.println("<tr bgcolor='aqua'>");
	out.println("<td>"+u.getId()+"</td>");
	out.println("<td>"+u.getName()+"</td>");
	out.println("<td>"+u.getEmail()+"</td>");
	}
out.println("</table>");
sess.close();
sf.close();

%>

</body>
</html>