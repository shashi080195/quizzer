

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckUser
 */
@WebServlet("/CheckUser")
public class CheckUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUser() {
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
		try {
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://C:/Users/shashi/workspace/quizzer/quizzerDb.accdb","","");
			PreparedStatement ps = con.prepareStatement("select uname,utype from UserRecord where uname=(?) and upass=(?)");
			ps.setString(1,request.getParameter("uname"));
			ps.setString(2,new Password().md5(request.getParameter("upass")));
			ResultSet rs =ps.executeQuery();
			if(rs.next()){
				HttpSession session = request.getSession();
				session.setAttribute("Uname",rs.getString(1));
				session.setAttribute("Utype",rs.getString(2));
				session.setMaxInactiveInterval(600);
				response.sendRedirect("index.jsp");
			}
			else{
				String msg="Invalid UserName or Password";
				response.sendRedirect("login.jsp?errMsg="+msg);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
