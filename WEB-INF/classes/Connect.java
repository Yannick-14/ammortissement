package connect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Connect
{
    private static final String URL="jdbc:postgresql://localhost:5432/amortissement";
    private static final String USER="postgres";
    private static final String PASSWORD="fanomezantsoa";

    public static Connection getConnection() throws SQLException
    {
        try
        {
            Class.forName("org.postgresql.Driver");
        }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL,USER,PASSWORD);
    }
}