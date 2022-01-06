<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String id=request.getParameter("id");
	ResultSet rs=null;
	
	try{
		String sql="select id from member1227 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
%>
	<script>
		alert("이미 등록된 아이디입니다.");
		history.back(-1);
	</script>
<%
		}
		}catch(SQLException e){
			System.out.println("조회 에러");
		}
%>	
<form name="form" method="post" action="insert_member.jsp">
<h1>회원 정보 등록 화면</h1>
<hr>
<table border=1 id="tab1">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" onchange="checksubmit()" value="<%=id %>"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="text" name="password"></td>
	</tr>
	<tr>
		<th>성별</th>
		<td><input type="radio" name="gender" value="남" checked>남
			<input type="radio" name="gender" value="여">여
		</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><input type="text" name="birth"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="mail1">@
			<select name="mail2">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="kakao.com">kakao.com</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td>
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="012">012</option>
				<option value="013">013</option>
				<option value="014">014</option>
			</select>-
			<input type="text" name="phone2" id="in2">-
			<input type="text" name="phone3" id="in2">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="address" id="in1"></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input type="text" name="nickname"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="submit" value="회원등록" onclick="check()">
			<input type="reset" value="다시작성"> 
		</td>
	</tr>
</table>
</form>
<script>
function check(){
	if(document.form.id.value==""){
		alert("아이디를 입력하세요.");
		document.form.id.focus();
	}else if(document.form.name.value==""){
		alert("이름을 입력하세요.");
		document.form.name.focus();
	}else if(document.form.password.value==""){
		alert("비밀번호를 입력하세요.");
		document.form.password.focus();
	}else{
		form.action="insert_memberProcess.jsp";
	}
}

function checksubmit(){
	document.form.submit();
}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>