package riverRegistrationInformation;

import com.river_information.Database.Sql_connect;

import javax.persistence.Id;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteService {
    public void delete_value(int Id) {
        Sql_connect sql_connect = new Sql_connect();

        Connection connection = sql_connect.connection();
        PreparedStatement statement = null;

        try {
            String querry = "Delete from information_river where Id=?";
            statement = connection.prepareStatement(querry);
            statement.setInt(1, Id);
            ;
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
