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
    GestionUtilisateur gestion=new GestionUtilisateur();
%>
<%
    double capital=Double.parseDouble(request.getParameter("capital"));
    double taux=Double.parseDouble(request.getParameter("taux"));
    double dure=Double.parseDouble(request.getParameter("dure"));
    double nonRetour=Double.parseDouble(request.getParameter("nonRetour"));
    double methode=Double.parseDouble(request.getParameter("methode"));
    double mode=Double.parseDouble(request.getParameter("mode"));
    String olona=request.getParameter("olona");
    if(olona != null && !olona.trim().isEmpty())
    {
        double idOlona=Double.parseDouble(olona);
        gestion.insererUser(idOlona,methode,mode,dure,nonRetour,capital,taux);
        if(methode==1)
        {
            if(mode==1)
            {
                insertion.insertion(capital,idOlona,taux,dure,nonRetour);
                response.sendRedirect("pret.jsp");
            }
            if(mode==2)
            {
                double taux_mensuel=taux/12;
                double periode_mensuel=dure*12;
                double nonRetour_mensuel=nonRetour*12;
                out.println("taux_mensuel"+taux_mensuel);
                out.println("periode_mensuel"+periode_mensuel);
                insertion.insertion(capital,idOlona,taux_mensuel,periode_mensuel,nonRetour_mensuel);
                response.sendRedirect("pret.jsp");
            }
            if(mode==3)
            {
                double taux_trimestre=taux/4;
                double periode_trimestre=dure*4;
                double nonRetour_trimestre=nonRetour*4;
                out.println("taux_trimestre"+taux_trimestre);
                out.println("periode_trimestre"+periode_trimestre);
                insertion.insertion(capital,idOlona,taux_trimestre,periode_trimestre,nonRetour_trimestre);
                response.sendRedirect("pret.jsp");
            }
            if(mode==4)
            {
                double taux_semestre=taux/2;
                double periode_semestre=dure*2;
                double nonRetour_semestre=nonRetour*2;
                out.println("taux_semestre"+taux_semestre);
                out.println("periode_semestre"+periode_semestre);
                insertion.insertion(capital,idOlona,taux_semestre,periode_semestre,nonRetour_semestre);
                response.sendRedirect("pret.jsp");
            }
        }
        if(methode==2)
        {
            out.println("Annuite");
            if(mode==1)
            {
                insertion.insertion_annuite_fixe(capital,idOlona,taux,dure,nonRetour);
                response.sendRedirect("pret.jsp");
            }
            if(mode==2)
            {
                double taux_mensuel=taux/12;
                double periode_mensuel=dure*12;
                double nonRetour_mensuel=nonRetour*12;
                out.println("taux_mensuel"+taux_mensuel);
                out.println("periode_mensuel"+periode_mensuel);
                insertion.insertion_annuite_fixe(capital,idOlona,taux_mensuel,periode_mensuel,nonRetour_mensuel);
                response.sendRedirect("pret.jsp");
            }
            if(mode==3)
            {
                double taux_trimestre=taux/4;
                double periode_trimestre=dure*4;
                double nonRetour_trimestre=nonRetour*4;
                out.println("taux_trimestre"+taux_trimestre);
                out.println("periode_trimestre"+periode_trimestre);
                insertion.insertion_annuite_fixe(capital,idOlona,taux_trimestre,periode_trimestre,nonRetour_trimestre);
                response.sendRedirect("pret.jsp");
            }
            if(mode==4)
            {
                double taux_semestre=taux/2;
                double periode_semestre=dure*2;
                double nonRetour_semestre=nonRetour*2;
                out.println("taux_semestre"+taux_semestre);
                out.println("periode_semestre"+periode_semestre);
                insertion.insertion_annuite_fixe(capital,idOlona,taux_semestre,periode_semestre,nonRetour_semestre);
                response.sendRedirect("pret.jsp");
            }
        }
    }
    else
    {
        out.println("ID invalide");
    }

%>