

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	Connection con;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String utype=request.getParameter("utype");
		String uname=request.getParameter("uname");
		String upass=request.getParameter("upass");
		String uemail = request.getParameter("uemail");
		 try {
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://C:/Users/shashi/workspace/quizzer/quizzerDb.accdb","","");
			PreparedStatement ps = con.prepareStatement("insert into UserRecord(uemail,uname,upass,utype) values(?,?,?,?)");
			ps.setString(1,uemail);
			ps.setString(2,uname);
			ps.setString(3,new Password().md5(upass));
			ps.setString(4,utype);
			if(ps.executeUpdate()==1){
				HttpSession session = request.getSession();
				session.setAttribute("Uname",uname);
				session.setAttribute("Utype",utype);
				session.setMaxInactiveInterval(10);
				response.sendRedirect("index.jsp");
			}
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
