<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- �߰� -->
<%@page import="com.company.MVC_Model1_Board.board.BoardVO" %>
<%@page import="com.company.MVC_Model1_Board.board.BoardDAO" %>

<%
	//1. ����� �Է� ���� ����	
	String seq = request.getParameter("seq");

	//2. DB ���� ó��
	BoardVO vo = new BoardVO();	
	vo.setSeq(Integer.parseInt(seq));
	
	BoardDAO boardDAO = new BoardDAO();
	boardDAO.deleteBoard(vo);
	
	//3. ȭ�� �׺���̼�
	response.sendRedirect("getBoardList.jsp");
%>