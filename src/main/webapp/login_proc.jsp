<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 추가 -->  
<%@ page import="com.company.MVC_Model1_Board.user.UserVO" %>  
<%@ page import="com.company.MVC_Model1_Board.user.UserDAO" %>
<%@ page contentType="text/html; charset=EUC-KR" %>

<%	//자바코드 코딩
	//1.사용자 입력 정보 추출
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//2. DB 연동 처리
	UserVO vo = new UserVO(); //객체 생성
	vo.setId(id);
	vo.setPassword(password);
	
	UserDAO userDAO = new UserDAO();  //객체 생성
	UserVO user = userDAO.getUser(vo);
	
	//3. 화면 네비게이션 처리
	if(user != null){
		//out.println("<script>alert('로그인 성공!!');</script>");
		response.sendRedirect("getBoardList.jsp");
	}else{
		out.println("<script>alert('로그인 실패!!');</script>");
		response.sendRedirect("login.jsp");
	}	
%>   







 
