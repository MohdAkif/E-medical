<%@page import ="java.sql.*"%>
<%
try
{
   String[] login_detail=request.getParameterValues("c2");
	//step-1 register the driver
	Class.forName("com.mysql.jdbc.Driver");
	//step-2 create connection
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","@Akif12345");
	Statement s=con.createStatement();
	//step-3 Execute statement
	ResultSet rs=s.executeQuery("select email_id,password from registration;");
	int count=0;
	while(rs.next())
    {
		if(rs.getString(1).equals(login_detail[0])&&rs.getString(2).equals(login_detail[1]))
        {
            count+=1;
            break;
        }
    }
	if(count==1)
    {
        session.setAttribute("email",login_detail[0]);
        response.sendRedirect("../First_Page/Insert.jsp");
    }
	else
	{
        out.println("<script type='text/javascript' language='javascript'>");
        out.println("alert('Incorrect Detail');");
        out.println("window.location.href='../Akif/login.html';");
        out.println("</script>");
	}
	con.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>