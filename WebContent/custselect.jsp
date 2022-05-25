<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section id="sec1">
<%@include file="DBConn.jsp" %>
<br>
<h2>회원매출조회</h2>
<br>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
try{
	String sql="select member0525.custno,custname,grade,sum(price) from member0525,money0525 where member0525.custno=money0525.custno group by member0525.custno,custname,grade order by sum(price) desc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString(1);
		String custname=rs.getString(2);
		String grade=rs.getString(3);
		String sum=rs.getString(4);
switch(grade){
		
		
		case "A" : grade="VIP";
		    
		break;
		case "B" : grade="일반";
		break;
		case "C" : grade="직원";
		break;
		}	 

%>
<table border="1" id="tab1">
<tr>
<th>회원번호</th>
<th>회원성명</th>
<th>고객등급</th>
<th>매출</th>
</tr>
<tr>
<td><%=custno %></td>
<td><%=custname %></td>
<td><%=grade %></td>
<td><%=sum %></td>
</tr>
<% 
}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
</section>
<%@include file="footer.jsp" %>
</body>
</html>