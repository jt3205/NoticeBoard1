<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>�� ���</h1>
		<a href="logout_prog.jsp">�α׾ƿ�</a>
		<hr>
		<form action="insertBoard_proc.jsp" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">����</td>
					<td align="left"><input name="title" type="text"></td>
				</tr>
				<tr>
					<td bgcolor="orange">�ۼ���</td>
					<td align="left"><input name="writer" type="text"></td>
				</tr>
				<tr>
					<td bgcolor="orange">����</td>
					<td align="left"><textarea rows="10" cols="40" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="�� ���">
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="getBoardList.jsp">�� ��� ����</a>
	</center>
</body>
</html>