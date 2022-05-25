<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check(){
	var doc=document.form;
	if(doc.custno.value==""){
		alert("id가 입력되지 않았습니다.");
		doc.custno.focus();
	
	}else if(doc.custname.value==""){
		alert("성명이 입력되지 않았습니다");
		doc.custname.focus();
	}else if(doc.phone.value==""){
		alert("전화번호가 입력되지 않았습니다.");
		doc.phone.focus();
	}else if(doc.address.value==""){
		alert("주소가 입력되지 않았습니다.");
		doc.address.focus();
	}else if(doc.joindate.value==""){
			alert("가입일자가 입력되지 않았습니다");
			doc.joindate.focus();
	}else if(doc.grade.value==""){
		alert("고객등급이 입력되지 않았습니다");
		doc.grade.focus();
		
	}else if(doc.city.value==""){
		alert("도시코드가 입력되지 않았습니다.");
		doc.city.focus();
	}else{
		doc.submit();
		alert("회원정보수정이 완료 되었습니다");
	}
	
}
function check1() {
	location.href="select.jsp";
}
</script>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>

<section id="sec1">
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cc=0;
try{

  String sql="select max(custno)from member0525";
  pstmt=conn.prepareStatement(sql);
  rs=pstmt.executeQuery();
  if(rs.next()){
	  cc=rs.getInt(1)+1;
  
  
	  
  }else{
	  cc=1;
  }
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}

String custno=request.getParameter("custno");

try{
	String sql="select custname,phone,address,to_char(joindate,'YYYY-MM-DD'),grade,city from member0525 where custno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String custname=rs.getString("custname");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		String joindate=rs.getString(4);
		String grade=rs.getString("grade");
		String city=rs.getString("city");

%>
<h2>홈쇼핑 회원 수정</h2>
<form name="form" method="post" action="updateProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>회원번호(자동발생)</th>
<td>
<input type="text" name="custno" value="<%=custno %>"></td>
</tr>
<tr>
<th>회원성명</th>
<td>
<input type="text" name="custname" value="<%=custname %>"></td>
</tr>
<tr>
<th>회원전화</th>
<td><input type="text" name="phone" value="<%=phone %>"></td>
</tr>
<tr>
<th>회원주소</th>
<td>
<input type="text" name="address" value="<%=address %>"></td>
</tr>
<tr>
<th>가입일자</th>
<td><input type="text" name="joindate" value="<%=joindate%>"></td>
</tr>
<tr>
<th>고객등급[A:VIP,B:일반,C:직원]</th>
<td><input type="text" name="grade" value="<%=grade %>"></td>
</tr>
<tr>
<th>도시코드</th>
<td><input type="text" name="city" value="<%=city %>"></td>
</tr>
<tr>
<td colspan="2" id="btd1">
<input type="button" value="등록" onclick="check()" id="bt1">
<input type="button" value="조회" id="bt1" onclick="check1()"></td>
</tr>
<% 
}
	
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>