<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.sql.*"%>
<link href="css/custom.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/design.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table {
    border-collapse: separate;
    empty-cells: hide;
}
</style>
<title>Display Question</title>
</head>
<body>
	<jsp:include page="header1.jsp"></jsp:include>
	<%
		int qno=1;
		
		if(session.getAttribute("Uname")==null){
			response.sendRedirect("login.jsp");
		}
		else if(request.getParameter("sub")==null||request.getParameter("isOn")==null||request.getParameter("day")==null||request.getParameter("uname")==null||request.getParameter("tag")==null){
			response.sendRedirect("index.jsp");
		}
		
		String Sub=request.getParameter("sub");
		String isOn=request.getParameter("isOn");
		String dt=request.getParameter("day")+" "+request.getParameter("tm");
		String uname=request.getParameter("uname");
		String tag=request.getParameter("tag");
		Connection con;
		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		con = DriverManager.getConnection("jdbc:ucanaccess://C:/Users/shashi/workspace/quizzer/quizzerDb.accdb","","");
		PreparedStatement ps=con.prepareStatement("select ques,opt1,opt2,opt3,opt4,ans from quizQuest where uname=(?) and sub=(?) and quizDate=(?)");
		ps.setString(1,uname);
		ps.setString(2,Sub);
		ps.setString(3,dt);
		ResultSet rs = ps.executeQuery();
		out.print("<div class=container col-sm-6>");
		out.print("<div class=panel>");
		out.print("<table class=table border=1 id=t1>");
		while(rs.next()){
			//out.print("<tbody>");
			out.print("<tr><td id=ques colspan=2>Q-"+qno+")"+rs.getString(1)+"</td></tr>");
			out.print("<tr onClick=myfun()><td width=100>1.</td><td>"+rs.getString(2)+"</td><td style=display:none>"+qno+"</td></tr>");
			out.print("<tr onClick=myfun()><td width=100>2.</td><td>"+rs.getString(3)+"</td><td style=display:none>"+qno+"</td></tr>");
			out.print("<tr onClick=myfun()><td width=100>3.</td><td>"+rs.getString(4)+"</td><td style=display:none>"+qno+"</td></tr>");
			out.print("<tr onClick=myfun()><td width=100>4.</td><td>"+rs.getString(5)+"</td><td style=display:none>"+qno+"</td></tr>");
			out.print("<tr><td></td><td style=display:none id=tbr"+qno+"></td></tr>");
			out.print("<tr style=display:none id=ans"+qno+"><td>"+rs.getString(6)+"</td></tr>");
			out.print("<tr style=display:none id=tbf"+qno+"><td>"+tag+"</td></tr>");
			out.print("<tr style=display:none id=isGiven"+qno+"><td>0</td></tr>");
			//out.print("</tbody>");
			qno++;
		}
		out.print("<tr style=display:none id=marks><td>0</td></tr>");
		if(tag.equalsIgnoreCase("true")){		
			out.print("<tr><td colspan=3><button onClick=showResult()>submit</button></td></tr>");
		}
		out.print("</table>");
		out.print("</div>");
		out.print("</div>");
		con.close();
	%>

<script>
function myfun()
{
	var rows = document.getElementById("t1").rows;
    for (i = 1; i < rows.length; i++) {
        rows[i].onclick = function(){ return function(){
               var given_ans = this.cells[1].innerHTML;
              // alert(given_ans);
               var num=this.cells[2].innerHTML;
               var str="tbr"+num;
               var ans="ans"+num;
              //var col1="tdr"+num;
               var tag=document.getElementById("tbf"+num).cells[0].innerHTML;
               
               if(tag=="false"){
            	   
               		document.getElementById(str).style.display='block';
               		
               		var exp_ans=document.getElementById(ans).cells[1].innerHTML;
               		if(given_ans==exp_ans){
            			   document.getElementById(str).innerHTML="Correct Answer ";
               		}
               		else{
            			   document.getElementById(str).innerHTML="Wrong Answer,The correct answer is "+exp_ans;
               		}
               }
               else{
            	   
            	    document.getElementById(str).style.display='block';
              		var exp_ans=document.getElementById(ans).cells[0].innerHTML;
              		var isGiven=document.getElementById("isGiven"+num).cells[0];
              		//alert(isGiven.innerHTML);
              		if(isGiven.innerHTML=="0"){
              			document.getElementById(str).innerHTML="You have choosen answer:"+given_ans;
              			if(given_ans==exp_ans){
                  			var show_ans=document.getElementById('marks').cells[0];	
                  			var ans=parseInt(show_ans.innerHTML)+1;
                  			//alert(ans);
                  			show_ans.innerHTML=ans;
                		}
              			isGiven.innerHTML="1";
              			
              		}
              		else {
              			alert('you have selected the answer for once');
              		}
          			
               }
        };}(rows[i]);
    }
}

function showResult(){
	var show_ans=document.getElementById('marks').cells[0];
	alert(show_ans.innerHTML);
}
</script>
</table>
</body>
</html>