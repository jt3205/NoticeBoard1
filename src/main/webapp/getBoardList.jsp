<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.company.MVC_Model1_Board.board.BoardVO" %>
<%@ page import="com.company.MVC_Model1_Board.board.BoardDAO" %>
<%@ page import="java.util.List" %>

<%
	BoardVO vo = new BoardVO();
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> boardList = boardDAO.getBoardList(vo);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>board 테이블 전체 레코드 보여주기</title>
</head>
<body>
	<center>
		<h1>게시글 목록</h1>
		<h3>테스트님 환영합니다.<a href="logout_proc.jsp">로그아웃</a></h3>
		<form action="getBoardList.jsp" method="post">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right">
						<select name="searchCondition">
							<option value="WRITER">작성자</option>
							<option value="TITLE">제목</option>
						</select>
						<input name="searchKeyword" type="text">
						<input type="submit" value="검색">
					</td>
				</tr>
			</table>
		</form>
		<table border="1" cellspacing="0" cellpadding="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">번호</th>
				<th bgcolor="orange" width="200">제목</th>
				<th bgcolor="orange" width="150">작성자</th>
				<th bgcolor="orange" width="150">등록일</th>
				<th bgcolor="orange" width="100">조회수</th>
			</tr>
			<% for(BoardVO board : boardList){ %>
			<tr>
				<td align="center"><%= board.getSeq() %></td>
				<td align="left"><a href="getBoard.jsp?seq=<%= board.getSeq() %>"><%= board.getTitle() %></a></td>
				<td align="center"><%= board.getWriter() %></td>
				<td align="center"><%= board.getRegDate() %></td>
				<td align="center"><%= board.getCnt() %></td>
			</tr>
			<%} %>
		</table>
		<hr>
		<a href="insertBoard.jsp">새글등록</a>
	</center>
</body>
</html>