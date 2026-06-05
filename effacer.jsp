<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mindrana.Emprunt" %>
<%@ page import="mouvement.Insertion" %>
<%
    Insertion insertion=new Insertion();
    insertion.vider();
    response.sendRedirect("pret.jsp");
%>