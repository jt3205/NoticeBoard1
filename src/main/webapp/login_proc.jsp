<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- �߰� -->  
<%@ page import="com.company.MVC_Model1_Board.user.UserVO" %>  
<%@ page import="com.company.MVC_Model1_Board.user.UserDAO" %>
<%@ page contentType="text/html; charset=EUC-KR" %>

<%	//�ڹ��ڵ� �ڵ�
	//1.����� �Է� ���� ����
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//2. DB ���� ó��
	UserVO vo = new UserVO(); //��ü ����
	vo.setId(id);
	vo.setPassword(password);
	
	UserDAO userDAO = new UserDAO();  //��ü ����
	UserVO user = userDAO.getUser(vo);
	
	//3. ȭ�� �׺���̼� ó��
	if(user != null){
		//out.println("<script>alert('�α��� ����!!');</script>");
		response.sendRedirect("getBoardList.jsp");
	}else{
		out.println("<script>alert('�α��� ����!!');</script>");
		response.sendRedirect("login.jsp");
	}	
%>   







 
