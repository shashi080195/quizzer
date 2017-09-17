<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Enumeration<String> en=request.getParameterNames();
Connection con;
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
con = DriverManager.getConnection("jdbc:ucanaccess://C:/Users/shashi/workspace/quizzer/quizzerDb.accdb","","");

PreparedStatement ps;
String str = session.getAttribute("Uname").toString();
ps =con.prepareStatement("select count(*) from quizQuest where uname=(?)");
ps.setString(1,str);
ResultSet rs = ps.executeQuery();
rs.next();
int count = rs.getInt(1);
count++;
String sub = request.getParameter(en.nextElement());
String date = request.getParameter(en.nextElement());

int flag=1;
ps =con.prepareStatement("insert into quizQuest(uname,ques,opt1,opt2,opt3,opt4,ans,isOn,quesNum,quizDate,sub) values(?,?,?,?,?,?,?,?,?,?,?)");
while(en.hasMoreElements()){
	ps.setString(1,str);
	for(int i=2;i<=7;i++){
		
		ps.setString(i,request.getParameter(en.nextElement()));
	}
	ps.setInt(8,0);
	ps.setInt(9,count++);
	ps.setString(10,date);
	ps.setString(11,sub);
	ps.executeUpdate();
	flag++;
	if(flag==4)
		en.nextElement();
	
}
response.sendRedirect("index.jsp?report=1");
%>
</body>
</html>