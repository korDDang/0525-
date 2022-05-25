
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>
<section id="sec1">
<br>
<h2>회원목록조회/수정</h2>
<br>
<% 
ResultSet rs=null;
PreparedStatement pstmt=null;
try{
  String sql="select custno,custname,phone,address,to_char(joindate,'YYYY-MM-DD'),grade,city from member0525";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString("custno");
		String custname=rs.getString("custname");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		String joindate=rs.getString("to_char(joindate,'YYYY-MM-DD')");
		String grade=rs.getString("grade");
		String city=rs.getString("city");
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
<th>전화번호</th>
<th>주소</th>
<th>가입일자</th>
<th>고객등급</th>
<th>거주지역</th>
</tr>
<tr>
<td><a href="update.jsp?custno=<%=custno%>"><%=custno %></a></td>
<td><%=custname %></td>
<td><%=phone %></td>
<td><%=address %></td>
<td><%=joindate %></td>
<td><%=grade %></td>
<td><%=city %></td>
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