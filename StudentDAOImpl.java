package com.crud.service;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.crud.bean.Student;
public class StudentDAOImpl {
	Session session;
	SessionFactory factory;

	protected void connect() throws SQLException {
			try {
				Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
				 factory = configuration.buildSessionFactory();
				 session = factory.openSession();
				 session.beginTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	protected void exit()
	{
		session.close();
		factory.close();
	}
	

	public void insertBook(Student student) {
		try {
		connect();
		session.save(student);
		session.getTransaction().commit();
		exit();
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<Student> listAllStudnets() throws SQLException {
		connect();
		try {
		return session.createQuery("SELECT a FROM Student a", Student.class).getResultList(); 
		}catch(Exception e)
		{e.printStackTrace();
		return null;}
		finally
		{
			exit();
		}
		}
	
	public void deleteStudent(Student student) throws SQLException {
		connect();
		try {
			session.delete(student);
			session.getTransaction().commit();
		}catch(Exception e)
		{e.printStackTrace();}
		finally {exit();}
	}
	
	public void updateStudent(Student student) throws SQLException {
		connect();
		try {
		session.saveOrUpdate(student);
		session.getTransaction().commit();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			exit();
		}
	}
	
	public Student getStudent(int id) throws SQLException {
		connect();	
		Student student = session.get(Student.class, id);
		return student;
	}




}
