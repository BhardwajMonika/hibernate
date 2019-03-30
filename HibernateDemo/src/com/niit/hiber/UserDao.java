package com.niit.hiber;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

public class UserDao {
	public static void main(String[] args) 
	{
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf = cfg.buildSessionFactory();
		Session session = sf.openSession();
		Transaction t = session.beginTransaction();
		
		User u1 = new User();
		u1.setId(104);
		u1.setName("Vivek");
		u1.setPassword("1234");
		u1.setEmail("vivek@gmail.com");
		
		session.save(u1);
		t.commit();
		System.out.println("Successfully Saved");
		session.close();
		sf.close();
	}
}
