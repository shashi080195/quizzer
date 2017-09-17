<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<meta http-equiv="refresh" content="120">
<%@page import="java.io.DataOutputStream"%>
<link href="css/custom.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/design.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- timer javascript -->
    <script>
    
// Set the date we're counting down to
var seconds=119;
// Update the count down every 1 second
var x = setInterval(function() {

 
 	
    // Output the result in an element with id="demo"
    document.getElementById("demo").innerHTML = "Your page will be reload after:"+ seconds + "s ";
    seconds--;
    // If the count down is over, write some text 
    if (seconds < 0) {
        location.reload();
    }
}, 1000);
</script>
    <!-- end of timer code -->
  <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.*" %>
    <%@ page import="java.net.*" %>
    <%@page import ="org.apache.commons.net.ntp.NTPUDPClient"%>
 <%@page import ="org.apache.commons.net.ntp.TimeInfo"%>
 <%@page import ="org.apache.commons.net.ntp.NtpV3Packet"%>
    
    
    
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    
        <%@include file="header1.jsp" %>
<table class="table">
  <thead>
    <tr colspan="2">
      <th>UpcomingQuiz</th>
      <th id="demo">Your page will be reload after:120s</th>
    </tr>
  </thead>
  <tbody>
    
        <% 
        int flag=0;
        String TIME_SERVER = "time.windows.com";
        NTPUDPClient timeClient = new NTPUDPClient();
		InetAddress inetAddress = InetAddress.getByName(TIME_SERVER);
		TimeInfo timeInfo = timeClient.getTime(inetAddress);
		NtpV3Packet message = timeInfo.getMessage();
		
		
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:/Users/shashi/workspace/quizzer/quizzerDb.accdb","","");
        PreparedStatement ps;
        ps =con.prepareStatement("select quizDate,uname from quizQuest where isOn=(?)");
        ps.setInt(1,0);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
        	rs.next();
        	rs.next();
        	flag=0;
        	String dt=rs.getString(1);
        	String name=rs.getString(2);
        	ps =con.prepareStatement("select sub from quizQuest where quizDate=(?) and uname=(?)");
        	ps.setString(1,dt);
        	ps.setString(2,name);
        	ResultSet rst = ps.executeQuery();
        	rst.next();
        	String sub=rst.getString(1);
        	SimpleDateFormat formatter =new SimpleDateFormat("yyyy-MM-dd HH:mm");
            java.util.Date convertedDate =(java.util.Date) formatter.parse(dt);
           long serverTime = message.getTransmitTimeStamp().getTime();
    		java.util.Date tim = new java.util.Date(serverTime);
    		//System.out.print(tim);
            long diff=(tim.getTime()-convertedDate.getTime());
            System.out.println(convertedDate.compareTo(tim));
            long diffHours = diff / (60 * 60 * 1000);
            long diffMinutes = diff / (60 * 1000) % 60;
            //System.out.println(diffMinutes);
            int diffInDays = (int) ((convertedDate.getTime() - tim.getTime()) / (1000 * 60 * 60 * 24));
            if(diffInDays==0&&diffHours==0&&convertedDate.compareTo(tim)<=0){
            	//System.out.println(convertedDate.compareTo(tim)+"In the if"+diffMinutes);
            	if(diffMinutes>=0&&diffMinutes<10)
            	{
            		
            		ps=con.prepareStatement("update quizQuest set isOn=(?) where quizDate=(?) and uname=(?)");
            		ps.setInt(1,1);
            		ps.setString(2,dt);
            		ps.setString(3,name);
            		ps.executeUpdate();
            		flag=1;
            	}
            }
            System.out.println(diffHours);
            if(tim.compareTo(convertedDate)>0){
            	if(diffMinutes>=10||diffHours>0)
            	{
            		
            		ps=con.prepareStatement("update quizQuest set isOn=(?) where quizDate=(?) and uname=(?)");
            		ps.setInt(1,2);
            		ps.setString(2,dt);
            		ps.setString(3,name);
            		ps.executeUpdate();
            		flag=1;
            	}
            }
            if(flag==0){
            	Scanner sc = new Scanner(dt);
            	String day=sc.next();
            	String time=sc.next();
            	String val="row",val1="#";
        		out.print("<tr>");
        		out.print("<td scope="+val+"><a href="+val1+">"+sub+"</a></td>");
        		out.print("<td scope="+val+">"+day+"</td>");
        		out.print("<td scope="+val+">"+time+"</td>");
            }
        }
        
        %>
        </tbody>
</table>

<!-- code to display the quizzes which are presently going on -->

<table class="table">
  <thead>
    <tr colspan="3">
      <th>PresentQuiz</th>
    </tr>
  </thead>
  <tbody>
    
        <% 
        
		
        ps =con.prepareStatement("select quizDate,uname from quizQuest where isOn=(?)");
        ps.setInt(1,1);
        rs = ps.executeQuery();
        while(rs.next()){
        	rs.next();
        	rs.next();
        	flag=0;
        	String dt=rs.getString(1);
        	String name=rs.getString(2);
        	ps =con.prepareStatement("select sub from quizQuest where quizDate=(?) and uname=(?)");
        	ps.setString(1,dt);
        	ps.setString(2,name);
        	ResultSet rst = ps.executeQuery();
        	rst.next();
        	String sub=rst.getString(1);
        	SimpleDateFormat formatter =new SimpleDateFormat("yyyy-MM-dd HH:mm");
            java.util.Date convertedDate =(java.util.Date) formatter.parse(dt);
            long serverTime = message.getTransmitTimeStamp().getTime();
    		java.util.Date tim = new java.util.Date(serverTime);
            long diff=(tim.getTime()-convertedDate.getTime());
            long diffMinutes = diff / (60 * 1000) % 60;
            //System.out.println(diffMinutes);
            long diffHours = diff / (60 * 60 * 1000);
            int diffInDays = (int) ((convertedDate.getTime() - tim.getTime()) / (1000 * 60 * 60 * 24));
            if(diffInDays==0&&diffHours==0){
            	if(diffMinutes>=10)
            	{
            		ps=con.prepareStatement("update quizQuest set isOn=(?) where quizDate=(?) and uname=(?)");
            		ps.setInt(1,2);
            		ps.setString(2,dt);
            		ps.setString(3,name);
            		ps.executeUpdate();
            		flag=1;
            	}
            }
            if(flag==0){
            	Scanner sc = new Scanner(dt);
            	String day=sc.next();
            	String time=sc.next();
            	String val="row",val1="showQuestion.jsp?sub="+sub+"&isOn=1"+"&uname="+name+"&day="+day+"&tm="+time+"&tag=true";
        		out.print("<tr>");
        		out.print("<td scope="+val+"><a href="+val1+">"+sub+"</a></td>");
        		out.print("<td scope="+val+">"+day+"</td>");
        		out.print("<td scope="+val+">"+time+"</td>");
            }
        }
        
        %>
        </tbody>
</table>


<!-- code to displayu the quizzes which have been expired -->
<table class="table">
  <thead>
    <tr colspan="3">
      <th>PastQuiz</th>
    </tr>
  </thead>
  <tbody>
  	 <% 
        ps =con.prepareStatement("select quizDate,uname from quizQuest where isOn=(?)");
        ps.setInt(1,2);
        rs = ps.executeQuery();
        while(rs.next()){
        	rs.next();
        	rs.next();
        	String dt=rs.getString(1);
        	String name=rs.getString(2);
        	ps =con.prepareStatement("select sub from quizQuest where quizDate=(?) and uname=(?)");
        	ps.setString(1,dt);
        	ps.setString(2,name);
        	ResultSet rst = ps.executeQuery();
        	rst.next();
        	String sub=rst.getString(1);
        	SimpleDateFormat formatter =new SimpleDateFormat("yyyy-MM-dd HH:mm");
            java.util.Date convertedDate =(java.util.Date) formatter.parse(dt);
            Scanner sc = new Scanner(dt);
            String day=sc.next();
            String time=sc.next();
            String val="row",val1="showQuestion.jsp?sub="+sub+"&isOn=2"+"&uname="+name+"&day="+day+"&tm="+time+"&tag=true";
        	out.print("<tr>");
        	out.print("<td scope="+val+"><a href="+val1+">"+sub+"</a></td>");
        	out.print("<td scope="+val+">"+day+"</td>");
        	out.print("<td scope="+val+">"+time+"</td>");
        }
         
        %>
        </tbody>
</table>
    </body>
</html>
