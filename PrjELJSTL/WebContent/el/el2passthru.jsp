<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setAttribute("val", "hahahaha");

   // 서버상에서 페이지 이동 forward
   RequestDispatcher rd = request.getRequestDispatcher("el2.jsp");
   rd.forward(request, response);
%>