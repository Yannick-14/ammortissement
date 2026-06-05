<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pers.Personne" %>
<%@ page import="pers.GestionPersonne" %>
<%
    GestionPersonne gestion=new GestionPersonne();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    body
    {
        /* background-color: #719aff; */
        /* background-color: #71e1ff; */
        /* background-color: #edf106; */
        background-color: #1d1c1cdd;
    }
    article
    {
        /* background-color: #71e1ff; */
        /* background-color: #71ffd6; */
        background-color: rgba(90, 90, 89, 0.986)  ;
        border-radius: 10px;
        /* background-color: #61c261; */
        padding: 3% 3%;
        padding-left: 10%;
        margin-left: 2%;
        margin-top: 4%;
        /* float: left; */
        clear: both;
    }
    article a
    {
        /* color: #4d2bf7; */
        /* color: #71ffd6; */
        color: #2c2a2a;
        font-family: "Rubik";
        font-weight: bold;
        font-size: 20px;
        text-decoration: none;
    }
    header a
    {
        color: antiquewhite;
        background-color: rgb(51, 51, 51);
        align-items: center;
        float: left;
        clear: both;
        border-style: solid;
        padding: 1% 1%;
        text-decoration: none;
        font-family: "Reem Kufi";
        border-radius: 5px;
        margin-bottom: 1%;
        margin-top: 1%;
    }
    header a:hover
    {
        background-color: rgb(59, 59, 59);
        border-radius: 10px;
        color: black;
        font-weight: bold;
        /* border-style: ridge; */
    }
</style>
<body>
    <header>
        <a href="index.html">Accueil</a>
    </header>
   <article>
        <ul>
            <%
            List<Personne> liste = gestion.recupererPersonnes();
            for (Personne user : liste) 
            {%>
                <a href="liste.jsp?identite=<% out.println(user.getId()); %>" method="get">-<% out.println(user.getNom()); %></a><br>
            <%}
            %>
        </ul>
   </article>
</body>
</html>