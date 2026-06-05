package mouvement;
import mindrana.*;
import connect.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Insertion
{
    public static double taux(double valeur)
    {
        return valeur/100;
    }
    public static double makaInteret(double capital,double taux)
    {
        return capital*taux;
    }
    public static double makaAmorti(double capital,double periode)
    {
        return capital/periode;
    }
    public static double makaValeur(double capital,double amorti)
    {
        return capital-amorti;
    }
    public static double makaAnnuite(double amorti,double interet)
    {
        return amorti+interet;
    }

    public static double annuite_fixe(double capital,double interet,double puissance)
    {
        double denominateur=1+interet;
        double new_puissance=puissance*(-1);
        double result=Math.pow(denominateur,new_puissance);
        return capital*interet/(1-result);
    }
    public static double amortissement(double annuite,double interet)
    {
        return annuite-interet;
    }
    public static double dernier_valeur(double olona,double dure)
    {
        PreparedStatement st = null;
        Connection conn=null;
        double valeur=0;
        try
        {
            conn=Connect.getConnection();
            String sql="SELECT valeur_nette FROM emprunt where personne=? and periode=?";
            st = conn.prepareStatement(sql);
            st.setDouble(1,olona);
            st.setDouble(2,dure);
            ResultSet resultSet = st.executeQuery();
            while (resultSet.next()) 
            {
                valeur=resultSet.getDouble("valeur_nette");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return valeur;
    }

    public static double dernier_valeurExistant(double olona)
    {
        PreparedStatement st = null;
        Connection conn=null;
        double valeur=0;
        try
        {
            conn=Connect.getConnection();
            String sql="SELECT valeur_nette FROM emprunt where personne=? order by idEmprunt DESC LIMIT 1";
            st = conn.prepareStatement(sql);
            st.setDouble(1,olona);
            ResultSet resultSet = st.executeQuery();
            while (resultSet.next()) 
            {
                valeur=resultSet.getDouble("valeur_nette");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return valeur;
    }

    public static double last_periode()
    {
        PreparedStatement st = null;
        Connection conn=null;
        double valeur=0;
        try
        {
            conn=Connect.getConnection();
            String sql="SELECT periode FROM emprunt order by idEmprunt DESC LIMIT 1";
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) 
            {
                valeur=resultSet.getDouble("periode");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return valeur;
    }

    public static int count_ligne(double personne)
    {
        PreparedStatement statement = null;
        Connection connexion=null;
        int isa=0;
        try
        {
            connexion=Connect.getConnection();
            String sql="SELECT count(idEmprunt) as count FROM emprunt where personne=?";
            statement = connexion.prepareStatement(sql);
            statement.setDouble(1, personne);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) 
            {
                isa=resultSet.getInt("count");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return isa;
    }
     public void vider()
    {
        PreparedStatement st = null;
        Connection conn=null;
        try
        {
            conn=Connect.getConnection();
            String sql="DELETE FROM emprunt";
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public void insertion(double capital, double personne ,double taux, double periode,double nonPayant) 
    {
        PreparedStatement st = null;
        double taux_obtenu = taux(taux);
        double interet = makaInteret(capital, taux_obtenu);
        double retour=periode-nonPayant;
        // double amorti = makaAmorti(capital, retour);
        // double annui = makaAnnuite(amorti, interet);
        // double val = makaValeur(capital, amorti);
        double val_non_paye=capital+taux;
        Connection conn = null;
        System.out.println("periode ajoute: "+periode);
        try {
            conn = Connect.getConnection();
            for (double i = 1; i <= periode; i++) 
            {
                System.out.println("periode: "+i);
                // int isa_ligne=count_ligne(personne);
                if(i<=nonPayant)
                {
                    int isa_ligne=count_ligne(personne);
                    if(isa_ligne==0)
                    {
                        System.out.println("vide");
                        String requete = "INSERT INTO emprunt(personne,periode,capital,interet,amortissement,annuite,valeur_nette) VALUES(?,?,?,?,?,?,?)";
                        st = conn.prepareStatement(requete);
                        st.setDouble(1,personne);
                        st.setDouble(2, i);
                        st.setDouble(3, capital);
                        st.setDouble(4, 0);
                        st.setDouble(5, 0);
                        st.setDouble(6, 0);
                        st.setDouble(7, val_non_paye);
                        st.executeUpdate();
                    }
                    if(isa_ligne!=0)
                    {
                        double last_valeurExistant = dernier_valeurExistant(personne);
                        double newVal=last_valeurExistant+taux;
                        String requete = "INSERT INTO emprunt(personne,periode,capital,interet,amortissement,annuite,valeur_nette) VALUES(?,?,?,?,?,?,?)";
                        st = conn.prepareStatement(requete);
                        st.setDouble(1,personne);
                        st.setDouble(2, i);
                        st.setDouble(3, last_valeurExistant);
                        st.setDouble(4, 0);
                        st.setDouble(5, 0);
                        st.setDouble(6, 0);
                        st.setDouble(7, newVal);
                        st.executeUpdate();
                    }
                }

                if(i>nonPayant)
                {
                    double last_valeur = dernier_valeur(personne,nonPayant);
                    double last_valeurB = dernier_valeurExistant(personne);
                    System.out.println(last_valeur);
                    double amorti = makaAmorti(last_valeur, retour);

                    double new_interet = makaInteret(last_valeurB, taux_obtenu);
                    double new_annui = makaAnnuite(amorti, new_interet);
                    double new_val = makaValeur(last_valeurB, amorti);
                    String requete = "INSERT INTO emprunt(personne,periode,capital,interet,amortissement,annuite,valeur_nette) VALUES(?,?,?,?,?,?,?)";
                    st = conn.prepareStatement(requete);
                    st.setDouble(1,personne);
                    st.setDouble(2, i);
                    st.setDouble(3, last_valeurB);
                    st.setDouble(4, new_interet);
                    st.setDouble(5, amorti);
                    st.setDouble(6, new_annui);
                    st.setDouble(7, new_val);
                    st.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertion_annuite_fixe(double capital, double personne ,double taux, double periode,double nonPayant) 
    {
        PreparedStatement st = null;
        double taux_obtenu = taux(taux);
        double interet = makaInteret(capital, taux_obtenu);
        double retour=periode-nonPayant;
        double new_vola=dernier_valeur(personne,nonPayant);
        // double annuite = annuite_fixe(new_vola,taux_obtenu,retour);
        // double amorti = annuite-interet;
        // double val = makaValeur(capital, amorti);
        double val_non_paye=capital+taux;


        Connection conn = null;
        System.out.println("periode ajoute: "+periode);
        try {
            conn = Connect.getConnection();
            for (double i = 1; i <= periode; i++) 
            {
                System.out.println("periode: "+i);
                int isa_ligne=count_ligne(personne);
                if(i<=nonPayant)
                {
                    if(isa_ligne==0)
                    {
                        System.out.println("vide");
                        String requete = "INSERT INTO emprunt(personne,periode,capital,interet,amortissement,annuite,valeur_nette) VALUES(?,?,?,?,?,?,?)";
                        st = conn.prepareStatement(requete);
                        st.setDouble(1,personne);
                        st.setDouble(2, i);
                        st.setDouble(3, capital);
                        st.setDouble(4, 0);
                        st.setDouble(5, 0);
                        st.setDouble(6, 0);
                        st.setDouble(7, val_non_paye);
                        st.executeUpdate();
                    }
                    if(isa_ligne!=0)
                    {
                        double last_valeur = dernier_valeurExistant(personne);
                        System.out.println(last_valeur);
                        double new_interet = makaInteret(last_valeur, taux_obtenu);
                        // double new_amorti = annuite-new_interet;
                        double new_val = last_valeur+taux;
                        String requete = "INSERT INTO emprunt(personne,periode,capital,interet,amortissement,annuite,valeur_nette) VALUES(?,?,?,?,?,?,?)";
                        st = conn.prepareStatement(requete);
                        st.setDouble(1,personne);
                        st.setDouble(2, i);
                        st.setDouble(3, last_valeur);
                        st.setDouble(4, 0);
                        st.setDouble(5, 0);
                        st.setDouble(6, 0);
                        st.setDouble(7, new_val);
                        st.executeUpdate();
                    }
                    
                }

                if(i>nonPayant)
                {
                    
                    double last_valeur = dernier_valeur(personne,nonPayant);
                    double last_valeurB = dernier_valeurExistant(personne);
                    System.out.println(last_valeur);
                    double annuite = annuite_fixe(last_valeur,taux_obtenu,retour);
                    // double amorti = annuite-interet;
                    double new_interet = makaInteret(last_valeurB, taux_obtenu);
                    double new_amorti = annuite-new_interet;
                    double new_val = last_valeurB-new_amorti;
                    String requete = "INSERT INTO emprunt(personne,periode,capital,interet,amortissement,annuite,valeur_nette) VALUES(?,?,?,?,?,?,?)";
                    st = conn.prepareStatement(requete);
                    st.setDouble(1,personne);
                    st.setDouble(2, i);
                    st.setDouble(3, last_valeurB);
                    st.setDouble(4, new_interet);
                    st.setDouble(5, new_amorti);
                    st.setDouble(6, annuite);
                    st.setDouble(7, new_val);
                    st.executeUpdate();
                    if(i==periode)
                    {
                        update(periode,personne);
                    }
                }
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void update(double periode,double personne)
    {
        PreparedStatement st = null;
        Connection conn = null;
        try
        {
            conn = Connect.getConnection();
            double val_final=dernier_valeurExistant(personne);
            double new_val_f=0.0;
            String requete = "UPDATE emprunt SET valeur_nette=? WHERE periode=? and personne=?";
            st = conn.prepareStatement(requete);
            st.setDouble(1,new_val_f);
            st.setDouble(2, periode);
            st.setDouble(3, personne);
        }
        catch(Exception e)
        {e.printStackTrace();}
    }
    public List<Emprunt> liste_emprunt(int personne)
    {
        PreparedStatement statement = null;
        Connection connexion = null;
        ResultSet rs = null;
        List<Emprunt> lsEmprunt = new ArrayList<>();
        try 
        {
            connexion = Connect.getConnection();
            String requete = "SELECT * FROM emprunt where personne=?";
            statement = connexion.prepareStatement(requete);
            statement.setInt(1, personne);
            rs = statement.executeQuery();
            while (rs.next()) 
            {
                Emprunt mindrana = new Emprunt();
                mindrana.setPeriode(rs.getDouble("periode"));
                mindrana.setPersonne(rs.getInt("personne"));
                mindrana.setCapital(rs.getDouble("capital"));
                mindrana.setInteret(rs.getDouble("interet"));
                mindrana.setAmorti(rs.getDouble("amortissement"));
                mindrana.setAnnuite(rs.getDouble("annuite"));
                mindrana.setValeur(rs.getDouble("valeur_nette"));
                lsEmprunt.add(mindrana);
            }
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return lsEmprunt;
    }

    public static void main(String[] args)
    {
        // double result=taux(10);
        // double i=makaInteret(10000,result);
        Insertion insertion=new Insertion();
        // insertion.insertion(100,4,10,6,2);
        insertion.insertion_annuite_fixe(100,5,10,6,2);
        // double vola=insertion.annuite_fixe(140,0.1,2);
        // System.out.println(vola);
        
        // insertion(20000,5,10);
        // insertion_annuite_fixe(20000,5,4);
        // System.out.println(result+" interet:"+i+" annuite: "+annui);
        // List<Emprunt> liste = insertion.liste_emprunt();
        // for (Emprunt emprunt : liste) 
        // {
        //     System.out.println(emprunt.getPeriode());
        //     System.out.println(emprunt.getCapital());
        //     System.out.println(emprunt.getInteret());
        //     System.out.println(emprunt.getAmorti());
        //     System.out.println(emprunt.getAnnuite());
        //     System.out.println(emprunt.getValeur());
        //     System.out.println("\n");
        // }
    }
    
}