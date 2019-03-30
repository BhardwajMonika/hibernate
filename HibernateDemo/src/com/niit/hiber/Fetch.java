package com.niit.hiber;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Fetch {

	public static void main(String[] args) {
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf = cfg.buildSessionFactory();
		Session session = sf.openSession();
		Transaction t = session.beginTransaction();
		
		Employee e1 = new Employee();
		e1.setId(102);
		e1.setFirstName("Shivani");
		e1.setLastName("Sales");
		e1.setSalary(5000);
		
		session.save(e1);
		t.commit();
		System.out.println("Successfully Saved");
		session.close();
		sf.close();
	}

}
