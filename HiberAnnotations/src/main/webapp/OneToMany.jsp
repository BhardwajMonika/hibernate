<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,
	com.niit.hiberAnnotations.Answer,
	com.niit.hiberAnnotations.Question,
    org.hibernate.boot.Metadata,
    org.hibernate.boot.MetadataSources,
    org.hibernate.boot.registry.StandardServiceRegistry,
    org.hibernate.boot.registry.StandardServiceRegistryBuilder,
    javax.persistence.TypedQuery" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Association Mapping Example-Maven Project</title>
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
	
	Answer ans1 = new Answer();
	ans1.setAnswername("Eclipse");
	ans1.setPostedby("Rag gs");
	
	Answer ans2 = new Answer();
	ans2.setAnswername("NetBeans");
	ans2.setPostedby("Sudhir Kumar");
	
	Answer ans3 = new Answer();
	ans3.setAnswername("instance of a class");
	ans3.setPostedby("Jai Kumar");
	
	Answer ans4 = new Answer();
	ans4.setAnswername("The object has state and behavior");
	ans4.setPostedby("Arun");
	
	ArrayList<Answer> list1 = new ArrayList<Answer>();
	list1.add(ans1);
	list1.add(ans2);
	
	ArrayList<Answer> list2 = new ArrayList<Answer>();
	list2.add(ans3);
	list2.add(ans4);
	
	Question question1 = new Question();
	question1.setQname("What are the Java IDE’s?");
	question1.setAnswers(list1);
	
	Question question2 = new Question();
	question2.setQname("What is an Object?");
	question2.setAnswers(list2);
	
	sess.persist(question1);
	sess.persist(question2);
	
	t.commit();
	//sess.close();
	out.println("Table Created and Record inserted successfully");
	
	out.println("***********************************Display Data***************************************");
	TypedQuery query=sess.createQuery("from Question");
	List<Question> list=query.getResultList();
	
	Iterator<Question> itr = list.iterator();
	while(itr.hasNext()){
		Question q=itr.next();
		out.println("Question Name : "+q.getQname());
		
		//printing answers
		List<Answer> list3 = q.getAnswers();
		Iterator<Answer> itr2=list3.iterator();
		while(itr2.hasNext())
		{
			Answer a =itr2.next();
			out.println(a.getAnswername()+":"+a.getPostedby());
		}
		out.println("<br>");
	}
	sess.close();
	System.out.println("success");
	%>

</body>
</html>