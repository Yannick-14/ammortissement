<!-- if(methode==1)
        {
            out.println("Amortissement");
            if(mode==1)
            {
                insertion.insertion(capital,idOlona,taux,dure);
                response.sendRedirect("pret.jsp");
            }
            if(mode==2)
            {
                double taux_mensuel=taux/12;
                double periode_mensuel=dure*12;
                out.println("taux_mensuel"+taux_mensuel);
                out.println("periode_mensuel"+periode_mensuel);
                insertion.insertion(capital,idOlona,taux_mensuel,periode_mensuel);
                response.sendRedirect("pret.jsp");
            }
            if(mode==3)
            {
                double taux_trimestre=taux/4;
                double periode_trimestre=dure*4;
                out.println("taux_trimestre"+taux_trimestre);
                out.println("periode_trimestre"+periode_trimestre);
                insertion.insertion(capital,idOlona,taux_trimestre,periode_trimestre);
                response.sendRedirect("pret.jsp");
            }
            if(mode==4)
            {
                double taux_semestre=taux/2;
                double periode_semestre=dure*2;
                out.println("taux_semestre"+taux_semestre);
                out.println("periode_semestre"+periode_semestre);
                insertion.insertion(capital,idOlona,taux_semestre,periode_semestre);
                response.sendRedirect("pret.jsp");
            }
        }
        if(methode==2)
        {
            out.println("Annuite");
            if(mode==1)
            {
                insertion.insertion_annuite_fixe(capital,idOlona,taux,dure);
                response.sendRedirect("pret.jsp");
            }
            if(mode==2)
            {
                double taux_mensuel=taux/12;
                double periode_mensuel=dure*12;
                out.println("taux_mensuel"+taux_mensuel);
                out.println("periode_mensuel"+periode_mensuel);
                insertion.insertion_annuite_fixe(capital,idOlona,taux_mensuel,periode_mensuel);
                response.sendRedirect("pret.jsp");
            }
            if(mode==3)
            {
                double taux_trimestre=taux/4;
                double periode_trimestre=dure*4;
                out.println("taux_trimestre"+taux_trimestre);
                out.println("periode_trimestre"+periode_trimestre);
                insertion.insertion_annuite_fixe(capital,idOlona,taux_trimestre,periode_trimestre);
                response.sendRedirect("pret.jsp");
            }
            if(mode==4)
            {
                double taux_semestre=taux/2;
                double periode_semestre=dure*2;
                out.println("taux_semestre"+taux_semestre);
                out.println("periode_semestre"+periode_semestre);
                insertion.insertion_annuite_fixe(capital,idOlona,taux_semestre,periode_semestre);
                response.sendRedirect("pret.jsp");
            }
        } -->

        List<Utilisateur> apropos = gestion.recupererUsers(idOlona);
            for (Utilisateur data : apropos) 
            {
            %>
                <li><Strong>Personne:</Strong><% out.println(data.getPers()); %></li>
                <li><Strong>Methode:</Strong>
                    <%
                        if(data.getMethode()==1)
                        {
                            out.println("Amortissement");
                        }
                        if(data.getMethode()==2)
                        {
                            out.println("Annuite");
                        }
                    %></li>
                <li><Strong>Mode:</Strong>
                    <% 
                        if(data.getMode()==1)
                        {
                            out.println("Annuel");
                        }
                        if(data.getMode()==2)
                        {
                            out.println("Mensuel");
                        }
                        if(data.getMode()==3)
                        {
                            out.println("Trimestriel");
                        }
                        if(data.getMode()==4)
                        {
                            out.println("Semestriel");
                        }
                    %></li>
                <li><Strong>dure en année:</Strong><% out.println(data.getDure()); %></li>
                <li><Strong>Capital demandé:</Strong><% out.println(data.getVola()); %></li>
                <li><Strong>Taux par an:</Strong><% out.println(data.getTaux()); %></li>
            <%  }