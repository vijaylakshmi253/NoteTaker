package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.ToDo;
import com.helper.FactoryProvider;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		int todoId=Integer.parseInt(request.getParameter("todo_id").trim());
		Session s=FactoryProvider.getFactory().openSession();
        Transaction tx=s.beginTransaction();
		ToDo todo=(ToDo)s.get(ToDo.class, todoId);
		s.delete(todo);	
		tx.commit();
		s.close();	
		response.sendRedirect("all_notes.jsp");
			
		} catch(Exception e){
			
		}
		
		
		
		
		
		
	}

	

}
