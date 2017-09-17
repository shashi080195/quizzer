<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="cross-browser rich text editor, rte, textarea, htmlarea, content management, cms, blog, internet explorer, firefox, safari, opera, netscape, konqueror" />
<meta name="description" content="The cross-browser rich-text editor (RTE) is based on the designMode() functionality introduced in Internet Explorer 5, and implemented in Mozilla 1.3+ using the Mozilla Rich Text Editing API." />
<meta name="author" content="Kevin Roth" />
<meta name="ROBOTS" content="ALL" />
<link href="css/custom.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/design.css" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script src="js/custom.js"></script>
	<!-- html2xhtml.js written by Jacob Lee <letsgolee@lycos.co.kr> //-->
	<script language="JavaScript" type="text/javascript" src="cbrte/html2xhtml.min.js"></script>
	<script language="JavaScript" type="text/javascript" src="cbrte/richtext.js"></script>
	
	<!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
<script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

<!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!--Font Awesome (added because you use icons in your prepend/append)-->
<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

<!-- Inline CSS based on choices in "Settings" tab -->
<style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>
<head>

<title>Quizzer</title>
</head>

<body>
	 <jsp:include page="header1.jsp"></jsp:include>
	  <%
       	if(session.getAttribute("Uname")==null){
       		response.sendRedirect("login.jsp");
       	}
       	else{
       		
       		%>
	<form name="RTEDemo" action="temp.jsp" method="post" onsubmit="return submitForm();">
	<div class="row">
	<div class="col-sm-4">
	<span class="pull-left">
      <label class="control-label col-sm-3 requiredField" for="sub">
       subject
       <span class="asteriskField">
        *
       </span>
      </label>
      <div class="col-sm-6">
       <div class="input-group">
        <div class="input-group-addon">
         <i class="fa fa-book">
         </i>
        </div>
        <input class="form-control" id="sub" name="sub" type="text"/>
       </div>
      </div>
      </span>
      </div>
     
      <div class="col-sm-4">
      
	<span class="pull-right">
      <label class="control-label col-sm-3 requiredField" for="date">
       Date
       <span class="asteriskField">
        *
       </span>
      </label>
      <div class="col-sm-6">
       <div class="input-group">
        <div class="input-group-addon">
         <i class="fa fa-calendar">
         </i>
        </div>
        
        <input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
       </div>
      </div>
      </span>
      </div>
       
     
      
     </div>
     <br>
	<script language="JavaScript" type="text/javascript">
	initRTE("cbrte/images/", "cbrte/", "", true);
function submitForm() {
	/*var a=document.RTEDemo.rte1;
	var b=document.RTEDemo.rte2;
	var c=document.RTEDemo.rte3;
	if(a.value==""||b.value==""||c.value==""){
		alert("must fill all required fields");
		return false;
	}*/
	updateRTEs();
	return true;
}
function doTrue(rs){
	rs.cmdFormatBlock = true;
	rs.cmdFontName = true;
	rs.cmdFontSize = true;
	rs.cmdIncreaseFontSize = true;
	rs.cmdDecreaseFontSize = true;

	rs.cmdBold = true;
	rs.cmdItalic = true;
	rs.cmdUnderline = true;
	rs.cmdStrikethrough = true;
	rs.cmdSuperscript = true;
	rs.cmdSubscript = true;

	rs.cmdJustifyLeft = true;
	rs.cmdJustifyCenter = true;
	rs.cmdJustifyRight = true;
	rs.cmdJustifyFull = true;

	rs.cmdInsertHorizontalRule = true;
	rs.cmdInsertOrderedList = true;
	rs.cmdInsertUnorderedList = true;

	rs.cmdOutdent = true;
	rs.cmdIndent = true;
	rs.cmdForeColor = true;
	rs.cmdHiliteColor = true;
	rs.cmdInsertLink = true;
	rs.cmdInsertImage = true;
	rs.cmdInsertSpecialChars = true;
	rs.cmdInsertTable = true;
	rs.cmdSpellcheck = true;

	rs.cmdCut = true;
	rs.cmdCopy = true;
	rs.cmdPaste = true;
	rs.cmdUndo = true;
	rs.cmdRedo = true;
	rs.cmdRemoveFormat = true;
	rs.cmdUnlink = true;

}
</script>
	<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
        Question 1</a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse in">
      <div class="panel-body">
      <!-- here each row is divided into two column one column has text area to enter the question while the other column has textbox to enter option for each question and answer for them -->
      <div class="row">
       <div class="col-md-6">
      		<script>
				var rte1 = new richTextEditor('rte1');
				rte1.html = 'here&#39;s the "\<em\>preloaded\<\/em\>&nbsp;\<b\>content\<\/b\>"';
				doTrue(rte1);
				rte1.build();
			</script>
	  </div>
	  <div class="col-md-6">
	  <span class="pull-right">
	  <div class="col-md-4">
	  		<span class="pull-left">
	  			<b><font size="5">option 1</font></b>
	  		</span>
	  </div>
	  <div class="col-md-7">
	  		<span class="pull-right">
	  			<input type="text" name="opt11" size="50"/>
	  		</span>
	  </div>
	  <br><br>
	  <div class="col-md-4">
	  		<span class="pull-left">
	  			<b><font size="5">option 2</font></b>
	  		</span>
	  </div>
	  <div class="col-md-7">
	  		<span class="pull-right">
	  			<input type="text" name="opt12" size="50"/>
	  		</span>
	  </div>
	  <br><br>
	  <div class="col-md-4">
	  		<span class="pull-left">
	  			<b><font size="5">option 3</font></b>
	  		</span>
	  </div>
	  <div class="col-md-7">
	  		<span class="pull-right">
	  			<input type="text" name="opt13" size="50"/>
	  		</span>
	  </div>
	  <br><br>
	  <div class="col-md-4">
	  		<span class="pull-left">
	  			<b><font size="5">option 4</font></b>
	  		</span>
	  </div>
	  <div class="col-md-7">
	  		<span class="pull-right">
	  			<input type="text" name="opt14" size="50"/>
	  		</span>
	  </div>
	  <br><br>
	  <div class="col-md-4">
	  		<span class="pull-left">
	  			<b><font size="5">Answer</font></b>
	  		</span>
	  </div>
	  <div class="col-md-7">
	  		<span class="pull-right">
	  			<input type="text" name="ans1" size="50"/>
	  		</span>
	  </div>
	  
	  </span>
	  </div>
  	</div>
      </div>
    </div>
  </div>
  <!-- end of first collapse section or end of section for question 1 -->
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
        Question 2</a>
      </h4>
    </div>
    <div id="collapse2" class="panel-collapse collapse">
      <div class="panel-body">
      	
      		<!-- here each row is divided into two column one column has text area to enter the question while the other column has textbox to enter option for each question and answer for them -->
            <div class="row">
             <div class="col-md-6">
            		<script>
      				var rte2 = new richTextEditor('rte2');
      				rte2.html = 'here&#39;s the "\<em\>preloaded\<\/em\>&nbsp;\<b\>content\<\/b\>"';
      				doTrue(rte2);
      				rte2.build();
      			</script>
      	  </div>
      	  <div class="col-md-6">
      	  <span class="pull-right">
      	  <div class="col-md-4">
      	  		<span class="pull-left">
      	  			<b><font size="5">option 1</font></b>
      	  		</span>
      	  </div>
      	  <div class="col-md-7">
      	  		<span class="pull-right">
      	  			<input type="text" name="opt21" size="50"/>
      	  		</span>
      	  </div>
      	  <br><br>
      	  <div class="col-md-4">
      	  		<span class="pull-left">
      	  			<b><font size="5">option 2</font></b>
      	  		</span>
      	  </div>
      	  <div class="col-md-7">
      	  		<span class="pull-right">
      	  			<input type="text" name="opt22" size="50"/>
      	  		</span>
      	  </div>
      	  <br><br>
      	  <div class="col-md-4">
      	  		<span class="pull-left">
      	  			<b><font size="5">option 3</font></b>
      	  		</span>
      	  </div>
      	  <div class="col-md-7">
      	  		<span class="pull-right">
      	  			<input type="text" name="opt23" size="50"/>
      	  		</span>
      	  </div>
      	  <br><br>
      	  <div class="col-md-4">
      	  		<span class="pull-left">
      	  			<b><font size="5">option 4</font></b>
      	  		</span>
      	  </div>
      	  <div class="col-md-7">
      	  		<span class="pull-right">
      	  			<input type="text" name="opt24" size="50"/>
      	  		</span>
      	  </div>
      	  <br><br>
      	  <div class="col-md-4">
      	  		<span class="pull-left">
      	  			<b><font size="5">Answer</font></b>
      	  		</span>
      	  </div>
      	  <div class="col-md-7">
      	  		<span class="pull-right">
      	  			<input type="text" name="ans2" size="50"/>
      	  		</span>
      	  </div>
      	  
      	  </span>
      	  </div>
        	</div>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
        Question 3</a>
      </h4>
    </div>
    <div id="collapse3" class="panel-collapse collapse">
      <div class="panel-body">
      		<!-- here each row is divided into two column one column has text area to enter the question while the other column has textbox to enter option for each question and answer for them -->
            <div class="row">
             <div class="col-md-6">
            		<script>
      				var rte3 = new richTextEditor('rte3');
      				rte3.html = 'here&#39;s the "\<em\>preloaded\<\/em\>&nbsp;\<b\>content\<\/b\>"';
      				doTrue(rte3);
      				rte3.build();
      			</script>
      	  </div>
      	  <div class="col-md-6">
      	  <span class="pull-right">
      	  <div class="col-md-4">
      	  		<span class="pull-left">
      	  			<b><font size="5">option 1</font></b>
      	  		</span>
      	  </div>
      	  <div class="col-md-7">
      	  		<span class="pull-right">
      	  			<input type="text" name="opt31" size="50"/>
      	  		</span>
      	  </div>
      	  <br><br>
      	  <div class="col-md-4">
      	  		<span class="pull-left">
      	  			<b><font size="5">option 2</font></b>
      	  		</span>
      	  </div>
      	  <div class="col-md-7">
      	  		<span class="pull-right">
      	  			<input type="text" name="opt32" size="50"/>
      	  		</span>
      	  </div>
      	  <br><br>
      	  <div class="col-md-4">
      	  		<span class="pull-left">
      	  			<b><font size="5">option 3</font></b>
      	  		</span>
      	  </div>
      	  <div class="col-md-7">
      	  		<span class="pull-right">
      	  			<input type="text" name="opt33" size="50"/>
      	  		</span>
      	  </div>
      	  <br><br>
      	  <div class="col-md-4">
      	  		<span class="pull-left">
      	  			<b><font size="5">option 4</font></b>
      	  		</span>
      	  </div>
      	  <div class="col-md-7">
      	  		<span class="pull-right">
      	  			<input type="text" name="opt34" size="50"/>
      	  		</span>
      	  </div>
      	  <br><br>
      	  <div class="col-md-4">
      	  		<span class="pull-left">
      	  			<b><font size="5">Answer</font></b>
      	  		</span>
      	  </div>
      	  <div class="col-md-7">
      	  		<span class="pull-right">
      	  			<input type="text" name="ans3" size="50"/>
      	  		</span>
      	  </div>
      	  
      	  </span>
      	  </div>
        	</div>
      </div>
    </div>
  </div>
</div>
	<div class="col-sm-6">
	<span class="pull-right">
	<input class="form-control"  value="submit" name="submit" type="submit"/>
	</span>
	</div>
	</form>
	<!-- Include jQuery -->


<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>

<script>
	$(document).ready(function(){
		var date_input=$('input[name="date"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datetimepicker({
			weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			forceParse: 0,
	        showMeridian: 1
		})
	})
</script>
	<%} %>
</body>
</html>