<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider" %>
<%@page import="org.hibernate.Session" %>
<%@page import="com.entities.* "%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All notes: ToDoList</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>


<div class="container">
 <%@include file="navbar.jsp" %>
 <br>
 <h4 class="text-uppercase">All Notes:</h4>
 
 <div class="row">
 <div class="col-12">
  <%
 Session s=FactoryProvider.getFactory().openSession();
 Query q=s.createQuery("from ToDo");
 List<ToDo> list=q.list();
 for(ToDo todo:list)
 {
	 %>
	 <div class="card mt-0">
  <img class="card-img-top" style="width:50px;" src="img/notebook.png" alt="Card image cap">
  <div class="card-body px-5">
    <h5 class="card-title"><%=todo.getTitle() %></h5>
    <p class="card-text">
    <%=todo.getContent() %>
    
    </p>
    <div class="container text-center mt-2">
    <a href="DeleteServlet?todo_id=<%=todo.getId() %>" class="btn btn-danger">Delete</a>
    <a href="edit.jsp?todo_id=<%= todo.getId() %>" class="btn btn-primary">Update</a>
    
    </div>  
  </div>
</div>
	 
	 
	 <%
	 
	 
 }
 
 s.close();
 %>

 
 
 
 
 
 </div>
 
 </div>
 



</div>
</body>
</html>