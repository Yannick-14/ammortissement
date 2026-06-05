<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mindrana.Emprunt" %>
<%@ page import="mouvement.Insertion" %>
<%@ page import="pers.GestionUtilisateur" %>
<%@ page import="pers.Utilisateur" %>
<%
    Insertion insertion=new Insertion();
    int idOlona=Integer.parseInt(request.getParameter("identite"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste de pret</title>
</head>
<style>
    body
    {
        background-color: rgb(29, 28, 28);
    }
    .container
    {
        margin-left: 5%;
        float: left;
        clear: both;
        margin-top: 3%;
    }
    h1
    {
        font-family: "Rubik";
        margin-left: 15%;
        color: rgb(114, 111, 111);
    }
    table
    {
        border-style: dotted;
    }
    table th
    {
        font-family: "Gentium Book Basic";
        padding: 2% 2%;
        width: 200px;
        background-color: rgb(29, 29, 29);
        color: rgb(227, 223, 218);
        font-size: 20px;
    }
    table td
    {
        width: 200px;
        padding: 2% 2%;
        font-family: "Rubik";
        background-color: rgb(64, 64, 64);
    }
    ul strong
    {
        color: rgb(114, 111, 111);
    }
    ul li
    {
        color: rgb(197, 196, 196);
    }
    a
    {
        color: rgba(250, 235, 215, 0.767);
        background-color: rgb(51, 51, 51);
        align-items: center;
        float: left;
        clear: both;
        border-style: solid;
        padding: 1% 1%;
        text-decoration: none;
        font-family: "Reem Kufi";
        border-radius: 5px;
    }
    a:hover
    {
        background-color: rgb(59, 59, 59);
        border-radius: 10px;
        color: rgb(32, 32, 32);
        font-weight: bold;
        /* border-style: ridge; */
    }
</style>
<body>
    <header>
        <h1>Deatils de pret</h1>
    <ul>
        <%
            GestionUtilisateur gestionPersonne=new GestionUtilisateur();
            List<Utilisateur> listePersonne = gestionPersonne.recupererUsers(idOlona);
            for (Utilisateur personne : listePersonne) 
            {%>
                <li><strong>Methode:</strong>
                    <%
                        if(personne.getMethode()==1)
                        {
                            out.println("Amortissement");
                        }
                        if(personne.getMethode()==2)
                        {
                            out.println("Annuite");
                        }
                    %>
                </li>
                <li><strong>Mode:</strong>
                    <%
                        if(personne.getMode()==1)
                        {
                            out.println("Annuel");
                        }
                        if(personne.getMode()==2)
                        {
                            out.println("Mensuel");
                        }
                        if(personne.getMode()==3)
                        {
                            out.println("Trimestriel");
                        }
                        if(personne.getMode()==4)
                        {
                            out.println("Semestriel");
                        }
                    %>
                </li>
                <li><strong>Dure:</strong>
                    <%
                        out.println(personne.getDure());
                    %>
                </li>
                <li><strong>Capital demande:</strong>
                    <%
                        out.println(personne.getVola());
                    %>
                </li>
                <li><strong>Taux annuel:</strong>
                    <%
                        out.println(personne.getTaux());
                    %>
                </li>
            <%}
        %>
            </ul>
    </header>
    <a href="listePers.jsp">Retour</a>
    <div class="container">
        <table>
            <tr>
                <th>Periode</th>
                <th>Capital</th>
                <th>Interet</th>
                <th>Amortissement</th>
                <th>Annuite</th>
                <th>Valeur nette</th>
            </tr>
                <%
                List<Emprunt> liste = insertion.liste_emprunt(idOlona);
                for (Emprunt emprunt : liste) 
                {%>
                    <tr>
                        <td><% out.println(emprunt.getPeriode()); %></td>
                        <td><% out.println(emprunt.getCapital()); %></td>
                        <td><% out.println(emprunt.getInteret()); %></td>
                        <td><% out.println(emprunt.getAmorti()); %></td>
                        <td><% out.println(emprunt.getAnnuite()); %></td>
                        <td><% 
                            if(emprunt.getValeur()<=0.90)
                            {
                                out.println("0");
                            }
                            else
                            {
                                out.println(emprunt.getValeur());
                            }
                             %></td>
                    </tr>
                <%}
                %>
        </table>
    </div>
</body>
</html>