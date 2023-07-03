<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>notice.jsp</h3>
<%

//dbcon
Class.forName("oracle.jdbc.driver.OracleDriver");

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url,user,pw);
//실행
String sql="select * from notices order by to_number(seq) desc";
Statement st=con.createStatement();
//결과
ResultSet rs=st.executeQuery(sql);
%>
<table width="500" border="1">

<tr>
	<td>번호</td>
	<td>제목</td>
	<td>작성자</td>
	<td>작성일</td>
	<td>조회수</td>
</tr>
<%
while(rs.next()){
%>
<tr>
	<td><%=rs.getString("seq") %></td>
	<td><a href="noticeDetail.jsp?c=<%=rs.getString("seq") %>"><%=rs.getString("title") %></a></td>
	<td><%=rs.getString("writer") %></td>
	<td><%=rs.getDate("regdate") %></td>
	<td><%=rs.getInt("hit") %></td>
</tr>
<%
}
%>
</table>

<a href="noticeReg.jsp">write</a>
</body>
</html>