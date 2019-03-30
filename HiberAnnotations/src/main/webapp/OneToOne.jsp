<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,
	com.niit.hiberAnnotations.Employee,
	com.niit.hiberAnnotations.Address,
    org.hibernate.boot.Metadata,
    org.hibernate.boot.MetadataSources,
    org.hibernate.boot.registry.StandardServiceRegistry,
    org.hibernate.boot.registry.StandardServiceRegistryBuilder,
    javax.persistence.TypedQuery" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	Configuration cfg = new Configuration();
	cfg.configure("hibernate.cfg.xml");

	SessionFactory sf = cfg.buildSessionFactory(
			new StandardServiceRegistryBuilder().configure().build());
	Session sess = sf.openSession();
	Transaction t = sess.getTransaction();
	t.begin();
	
	 Employee e1=new Employee();    
	    e1.setName("Mohan Kumar");    
	    e1.setEmail("mohan@gmail.com");    
	        
	    Address address1=new Address();    
	    address1.setAddressLine1("N-102,PratapGarh");    
	    address1.setCity("Rohtak");    
	    address1.setState("Haryana");    
	    address1.setCountry("India");    
	    address1.setPincode(560042);    
	        
	    e1.setAddress(address1);    
	    address1.setEmployee(e1);    
	        
	    sess.persist(e1);    
	    t.commit();    
	    
	    TypedQuery query=sess.createQuery("from Employee");
		List<Employee> list=query.getResultList();
	        
	    Iterator<Employee> itr=list.iterator();    
	    while(itr.hasNext()){    
	     Employee emp=itr.next();    
	    out.println(emp.getEmployeeId()+" "+emp.getName()+" "+emp.getEmail()+"<br>");    
	     Address address=emp.getAddress();    
	     out.println(address.getAddressLine1()+" "+address.getCity()+" "+    
	        address.getState()+" "+address.getCountry()+" "+address.getPincode()); 
	    }
	    sess.close();         
	
	   out.println("successfully Saved");    
	%>  
</body>
</html>