<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  
String s=request.getParameter("val");  
if(s==null || s.trim().equals("")){  
out.print("Please enter id");  
}else{  
int id=Integer.parseInt(s);  
out.print(id);  
try{
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sandy","root","sandy");  
PreparedStatement ps=con.prepareStatement("select * from school where id=?");  
ps.setInt(1,id);  
ResultSet rs=ps.executeQuery();  
while(rs.next()){  
	out.print(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3));  
}  
con.close();  
}catch(Exception e){e.printStackTrace();}  
}  
%>  

</body>
</html>