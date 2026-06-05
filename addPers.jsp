<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pers.GestionPersonne" %>
<%
    GestionPersonne gestion=new GestionPersonne();
    String anarana=request.getParameter("nom");
    gestion.insererPersonne(anarana);
    response.sendRedirect("personne.jsp");
%>