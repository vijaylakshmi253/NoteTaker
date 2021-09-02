<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.helper.*, org.hibernate.* ,com.entities.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <%@include file="all_js_css.jsp" %>
</head>
<body>
 <div class="container-fluid">
     <%@include file="navbar.jsp" %>
     <h4>Edit your note</h4>
     <br>
    
    <%
    int todoId=Integer.parseInt(request.getParameter("todo_id").trim());
    Session s=FactoryProvider.getFactory().openSession(); 
	ToDo todo=(ToDo)s.get(ToDo.class, todoId);
    
	
    %>
      <form action="UpdateServlet" method="post">
      <input value="<%= todo.getId() %>"name="todoId"  type="hidden"/>
      
  <div class="form-group">
    <label for="title">Note title</label>
    <input name="title" 
    required 
    type="text"
    class="form-control"
    id="title"
    aria-describedby="emailHelp"
    placeholder="Enter here"
    value="<%= todo.getTitle() %>"
     />
    </div>
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea
    name="content"
     required  
     id="content"
     placeholder="Enter your content here"
     class="form-control"
     style="height:200px;"><%= todo.getContent()%>
     </textarea>
    </div>
 <div class="container tex-center">
  <button type="submit" class="btn btn-success">Save your note</button>
 </div>
 
</form>
     
    </div>
</body>
</html>