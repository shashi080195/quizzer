<%-- 
    Document   : SignUp
    Created on : Jan 28, 2017, 5:06:19 PM
    Author     : shashi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<link href="css/custom.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/design.css" rel="stylesheet">
<script type="text/javascript">
  function checkPass()
  {
    var pass=document.getElementById("password");
  }
</script>

<head>
	<title>Quizzer</title>
</head>
<body>
    <%@include file="header1.jsp" %>
<div class="container">
<div class="vertical-center-row">
<div align="center">
<fieldset class="scheduler-border">
<h1 class="block-header alt">
<span>
	SignUp to your Account
</span>	
</h1>
<form class="form-horizontal" action="AddUser" method="post">
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
    <label for="inputEmail" class="sr-only">Email</label>
    <div class="col-sm-10">
    <div class="form-group has-feedback">
      <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="uemail">
      <i class="glyphicon glyphicon-user form-control-feedback"></i>
      </div>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPass" class="sr-only">Password</label>
    <div class="col-sm-10">
    <div class="form-group has-feedback">
      <input type="password" class="form-control" id="inputPass" placeholder="Password" name="upass">
      <i class="glyphicon glyphicon-lock form-control-feedback"></i>
    </div>
    </div>
  </div>
  <div class="form-group">
    <label for="inputCPass" class="sr-only">Confirm PassWord</label>
    <div class="col-sm-10">
    <div class="form-group has-feedback">
      <input type="password" class="form-control" id="inputCPass" placeholder="Confirm Password">
      <i class="glyphicon glyphicon-lock form-control-feedback"></i>
      </div>
    </div>
  </div>
 <div class="col-md-4">
<div class="col-md-6">
    <div class="funkyradio">
        <div class="funkyradio-default">
            <input type="radio" name="utype" id="radio1" value="teacher"/>
            <label for="radio1">Teacher</label>
        </div>
        <div class="funkyradio-default">
            <input type="radio" name="utype" id="radio2" value="student"checked/>
            <label for="radio2">Student</label>
        </div>
     </div>
 </div>
  <br>
  <br>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-lg btn-primary">Sign Up</button>
    </div>
  </div>
</form>


 
</fielset>
</div>
</div>
</div>
</body>
</html>