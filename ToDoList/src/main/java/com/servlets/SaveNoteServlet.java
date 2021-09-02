package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.ToDo;
import com.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		try
		{
			
			//title,content fetch
			
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	ToDo todo=new ToDo(title, content, new Date());
	
	//System.out.println(todo.getId()+" : " + todo.getTitle());
	//hibernate:save()
	Session s=FactoryProvider.getFactory().openSession();
	Transaction tx=s.beginTransaction();
	s.save(todo);
	tx.commit();
	s.close();
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	out.println("<h4 style='text-align:center;'>Note is added successfully</h4>");
	out.println("<h4 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h4>");
	
	
	s.close();
	
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
