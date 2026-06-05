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
public class GestionPersonne 
{
    public void insererPersonne(String nom)
    {
        Connection connection=null;

        try
        {
            connection=Connect.getConnection();
            String sql = "INSERT INTO personne (anarana) VALUES (?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nom);
            statement.executeUpdate();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public List<Personne> recupererPersonnes()
    {
        List<Personne> personnes = new ArrayList<>();
        Connection connection=null;
        try 
        {
            connection=Connect.getConnection();
            String sql = "SELECT * FROM personne";
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) 
            {
                Personne personne=new Personne();
                personne.setId(resultSet.getInt("idOlona"));
                personne.setNom(resultSet.getString("anarana"));
                personnes.add(personne);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return personnes;
    }
    // public static void main(String[] args)
    // {
    //     GestionPersonne gestionPersonne=new GestionPersonne();
    //     List<Personne> listePersonne = gestionPersonne.recupererPersonnes();
    //     for (Personne personne : listePersonne) 
    //     {
    //         System.out.println(personne.getId());
    //         System.out.println(personne.getNom());
    //     }
    // }
}