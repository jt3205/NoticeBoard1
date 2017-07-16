<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 추가 -->
<%@page import="com.company.MVC_Model1_Board.board.BoardVO" %>
<%@page import="com.company.MVC_Model1_Board.board.BoardDAO" %>

<%
	//1. 사용자 입력 정보 추출	
	String seq = request.getParameter("seq");

	//2. DB 연동 처리
	BoardVO vo = new BoardVO();	
	vo.setSeq(Integer.parseInt(seq));
	
	BoardDAO boardDAO = new BoardDAO();
	boardDAO.deleteBoard(vo);
	
	//3. 화면 네비게이션
	response.sendRedirect("getBoardList.jsp");
%>