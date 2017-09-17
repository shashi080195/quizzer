<%-- 
    Document   : header
    Created on : Jan 28, 2017, 4:27:11 PM
    Author     : shashi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="css/custom.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/design.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <body>
        <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">Quizzer</a>
    </div>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="SignUp.jsp">SignUp</a></li>
        
        
       <%
       String url="login.jsp";
    		String cls="dropdown";
       	if(session.getAttribute("Uname")==null){
       		out.print("<li><a href="+url+">Login</a></li>");
       	}
       	else{
       		%>
       		<li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%out.print(session.getAttribute("Uname")); %>
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
          <%
          if(session.getAttribute("Utype").equals("teacher")){
        	  url="newQuiz.jsp";
        	  out.print("<li><a href="+url+">Organize Quiz</a></li>");
          }
          else if(session.getAttribute("Utype").equals("student")){
        	  out.print("<li><a href=#>Attend Quiz</a></li>");
          }
          %>
            <li><a href="#">Rank Card</a></li>
            <li><a href="logout.jsp">LogOut</a></li>
          </ul>
        </li>
       		<%
       		
       	}
       %>
      </ul>
    </div><!-- /.navbar-collapse -->
</nav>
    </body>
</html>
