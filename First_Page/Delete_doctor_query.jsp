<%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
	String id=request.getParameter("id_name");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","@Akif12345");
	PreparedStatement ps=con.prepareStatement("delete from doctor where email_id=? and id=?;");
	ps.setString(1,session_email);
	ps.setString(2,id);
	ps.executeUpdate();
	out.println("<script type='text/javascript' language='javascript'>alert('Doctor Deleted');window.location.href='Delete_view.jsp';</script>");
	//response.sendRedirect("Delete_view.jsp");
	con.close();
%>	