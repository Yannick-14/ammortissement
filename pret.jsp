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
    <title>Demande</title>
    <style>
        h1
        {
            font-size: 30px;
            font-family: "Rubik";
            
            font-weight: bold;
            margin-left: 4%;
        }
        body
        {
            margin-left: 25%;
            margin-top: 2%;
            margin-right: 40%;
            background-color: rgb(43, 43, 43);
        }
        article
        {
            background-color: rgb(59, 58, 58);
            padding: 2% 20%;
            border-radius: 10px;
            font-family: "Rubik";
        }
        label
        {
            margin-bottom: 2%;
        }
        input,select
        {
            width: 250px;
            height: 40px;
            margin-bottom: 5%;
            border-radius: 8px;
            border-style: none;
            padding-left: 4%;
            background-color: rgb(206, 206, 206);
        }
        article button
        {
            width: 120px;
            height: 50px;
            border-radius: 7px;
            border-style: none;
            background-color: rgb(229, 180, 57);
            font-family:"Gentium Book Basic";
            font-size: 20px;
            color: rgb(227, 227, 227);
        }
        article form a
        {
            border-style: solid;
            margin-left: 10%;
            padding: 5% 5%;
            text-decoration: none;
            font-family:"Rubik";
            font-size: 20px;
            border-radius: 7px;
            color: rgb(229, 180, 57);
        }
        article .retour
        {
            margin-top: 5%;
            font-family: "Frank Ruehl CLM BoldOblique";
            color: rgb(229, 180, 57);
            font-size: 20px;
        }
        article .retour a
        {
            color: rgb(229, 180, 57);
            font-size: 20px;
        }
    </style>
</head>
<body>
    <article>
        <h1>EMPRUNT</h1>
        <form action="traitement.jsp" method="get">
            <label for="olona">Client:</label><br>
            <select name="olona" id="">
                <%
                List<Personne> liste = gestion.recupererPersonnes();
                for (Personne user : liste) 
                {%>
                    <option value="<% out.println(user.getId()); %>"><% out.println(user.getNom()); %></option>
                <%}
                %>
            </select><br>
            <label for="capital">Capital demander: </label><br>
            <input type="number" name="capital" id=""><br>
    
            <label for="">Taux d'Interet: </label><br>
            <input type="number" name="taux" id=""><br>
    
            <label for="annee">Dure d'annee:</label><br>
            <input type="number" name="dure" id=""><br>

            <label for="paye">Duree non retour:</label><br>
            <input type="number" name="nonRetour" id=""><br>
    
            <label for="">Methode de paiement: </label><br>
            <select name="methode" id="">
                <option value="1">Amortissement</option>
                <option value="2">Annuite</option>
            </select><br>
    
            <label for="">Mode de paiement: </label><br>
            <select name="mode" id="">
                <option value="1">Annuel</option>
                <option value="2">Mensuel</option>
                <option value="3">Trimestriel</option>
                <option value="4">Semestriel</option>
            </select><br>
    
            <button>VALIDER</button>
            <a href="effacer.jsp">vider</a>
        </form>
        <div class="retour">
            <a href="index.html">Retour</a>
        </div>
    </article>
</body>
</html>