<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="com.company.MVC_Model1_Board.board.BoardVO" %>
<%@ page import="com.company.MVC_Model1_Board.board.BoardDAO" %>

<%
	String seq = request.getParameter("seq");
	
	BoardVO vo = new BoardVO();
	vo.setSeq(Integer.parseInt(seq));
	
	BoardDAO boardDAO = new BoardDAO();
	BoardVO board = boardDAO.getBoard(vo);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>글 상세 보기</h1>
		<a href="logout_prog.jsp">로그아웃</a>
		<hr>
		<form action="updateBoard_proc.jsp" method="post">
			<input name="seq" type="hidden" value="<%= board.getSeq()%>">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input name="title" type="text" value="<%= board.getTitle()%>"></td>
				</tr>
				
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left"><%= board.getWriter()%></td>
				</tr>
				
				<tr>
					<td bgcolor="orange" width="70">내용</td>
					<td align="left"><textarea rows="10" cols="40" name="content"><%= board.getTitle()%></textarea> </td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정"></td>
				</tr>
			</table>
				
			<a href="insertBoard.jsp">글쓰기</a>
			<a href="deleteBoard_proc.jsp?seq=<%= board.getSeq() %>">삭제</a>
			<a href="getBoardList.jsp">목록</a>
		
		</form>
	</center>
</body>
</html>