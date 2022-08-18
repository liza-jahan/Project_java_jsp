package riverRegistrationInformation;

import com.river_information.Database.Sql_connect;

import javax.persistence.Id;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EditValueService {

    public RiverBean get_value_of_user(int Id){
        Sql_connect sql_connect = new Sql_connect();
        Connection connection = sql_connect.connection();
        PreparedStatement statement = null;
        ResultSet rs=null;
        RiverBean riverBean=new RiverBean();
        try {
            String query="select * from information_river where Id=?";
            statement=connection.prepareStatement(query);
            statement.setInt(1, Id);;
            rs=statement.executeQuery();
            while(rs.next()){

                riverBean.setDistrictName(rs.getString("District_name"));
                riverBean.setRiverName(rs.getString("River_name"));
                riverBean.setHeight(rs.getFloat("Height"));
                riverBean.setWidth(rs.getFloat("Width"));
                riverBean.setDepth(rs.getFloat("Depth"));
                riverBean.setInformation(rs.getString("Information"));

            }
        } catch (Exception e) {
            System.out.println(e);
        }
      return riverBean;
    }
    public void edit_user(  RiverBean riverBean ){
        Sql_connect sql_connect = new Sql_connect();
        Connection connection = sql_connect.connection();;
        PreparedStatement ps=null;
        try {
            String query="update information_river set District_name=?,River_name=?,Height=? ,Width=?,Depth=?,Information=? where Id=?";
            ps=connection.prepareStatement(query);
            ps.setString(1, riverBean.getDistrictName());;
            ps.setString(2, riverBean.getRiverName());;
            ps.setFloat(3, riverBean.getHeight());;
            ps.setFloat(4, riverBean.getWidth());;
            ps.setFloat(5, riverBean.getDepth());;
            ps.setString(6,riverBean.getInformation());;
            ps.setInt(7,riverBean.getId());;
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}


