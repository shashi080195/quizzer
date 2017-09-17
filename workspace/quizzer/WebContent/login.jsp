<%-- 
    Document   : login
    Created on : Jan 28, 2017, 5:10:57 PM
    Author     : shashi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<link href="css/custom.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/design.css" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script src="js/custom.js"></script>
<head>
	<title>Quizzer</title>
</head>
<body>
    <%@include file="header.jsp" %>
<div class="container">
<div class="vertical-center-row">
<div align="center">
<fieldset class="scheduler-border">
<h1 class="block-header alt">
<span>
	SignIn to your Account
</span>	
</h1>
<form class="form-horizontal" method="post" action="CheckUser">
  <div class="form-group">
    <label for="inputUName" class="sr-only">UserName</label>
    <div class="col-sm-10">
    <div class="form-group has-feedback">
      <input type="text" class="form-control" id="inputUName" placeholder="UserName" name="uname">
      <i class="glyphicon glyphicon-user form-control-feedback"></i>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="sr-only">Password</label>
    <div class="col-sm-10">
    <div class="form-group has-feedback">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="upass">
      <i class="glyphicon glyphicon-lock form-control-feedback"></i>
    </div>
    </div>
  </div>
  <%
  String msg=request.getParameter("errMsg");
  String classType="alert alert-danger fade in";
    		if(msg!=null){
    			out.print(msg);
    		}
    		%>
  <br>
  <br>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-lg btn-primary">Sign in</button>
    </div>
  </div>
</form>
<hr>
<!--footer-->
<p>
	Not Registered?
	<a href="SignUp.jsp">create an account</a>
</p>
<p>
              Lost your password? <a href="#lost-password__form" data-toggle="collapse" aria-expanded="true" aria-controls="lost-password__form" class="collapsed">
                Click here to recover
              </a>.
            </p>

            <div class="collapse" id="lost-password__form">

              <p class="text-muted">
                Enter your email address below and we will send you a link to reset your password.
              </p>

              <!-- Lost password -->
              <form class="form-inline">
                <div class="form-group">
                  <label class="sr-only" for="lost-password__email">Email address</label>
                  <input type="email" class="form-control" id="lost-password__email" placeholder="Enter email">
                </div>
                <button type="submit" class="btn btn-primary">Send</button>
              </form>

            </div> <!-- / #lost-password__form -->
 
</fielset>
</div>
</div>
</div>
</body>
</html>