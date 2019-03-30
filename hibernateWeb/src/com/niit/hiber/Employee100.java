package com.niit.hiber;
import java.util.Set;

public class Employee100 {

	private int employeeId;
	private String employeeName;
	private Set<String> phoneNumber;
	
	public Employee100() 
	{	}

	public Employee100(int employeeId, String employeeName, Set<String> phoneNumber) {
		super();
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.phoneNumber = phoneNumber;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public Set<String> getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(Set<String> phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	
}
