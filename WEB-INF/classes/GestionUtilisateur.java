package pers;
import connect.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Calendar;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
public class GestionUtilisateur 
{
    public void insererUser(double personne,double type,double mode,double dure,double nonRetour,double vola,double taux)
    {
        Connection connection=null;

        try
        {
            connection=Connect.getConnection();
            String sql = "INSERT INTO utilisateur_banque (personne,typeMethode,typemode,periode,nonRetour,gain,taux) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDouble(1, personne);
            statement.setDouble(2, type);
            statement.setDouble(3, mode);
            statement.setDouble(4, dure);
            statement.setDouble(5, nonRetour);
            statement.setDouble(6, vola);
            statement.setDouble(7, taux);
            statement.executeUpdate();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public List<Utilisateur> recupererUsers(int olona)
    {
        List<Utilisateur> array_user = new ArrayList<>();
        Connection connection=null;
        try 
        {
            connection=Connect.getConnection();
            String sql = "SELECT * FROM utilisateur_banque where personne=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,olona);
            ResultSet resultSet = st.executeQuery();
            while (resultSet.next()) 
            {
                Utilisateur user=new Utilisateur();
                user.setId(resultSet.getInt("idPersonne"));
                user.setPers(resultSet.getDouble("personne"));
                user.setMethode(resultSet.getDouble("typeMethode"));
                user.setMode(resultSet.getDouble("typemode"));
                user.setDure(resultSet.getDouble("periode"));
                user.setVola(resultSet.getDouble("gain"));
                user.setTaux(resultSet.getDouble("taux"));

                array_user.add(user);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return array_user;
    }
    public static void main(String[] args)
    {
        // GestionUtilisateur gestionPersonne=new GestionUtilisateur();
        // List<Utilisateur> listePersonne = gestionPersonne.recupererUsers(2);
        // for (Utilisateur personne : listePersonne) 
        // {
        //     System.out.println(personne.getMethode());
        //     System.out.println(personne.getMode());
        //     System.out.println(personne.getDure());
        // }
        double capital=2000000;
        double interet=10;
        double val_non_paye=capital+interet;
        System.out.println(val_non_paye);
    }
}