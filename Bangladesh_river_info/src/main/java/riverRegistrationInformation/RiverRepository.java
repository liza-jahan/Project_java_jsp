package riverRegistrationInformation;

import com.river_information.Database.Sql_connect;
import com.river_information.model.UserRegistrationRequest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RiverRepository {


    private static final String DISTRICT_NAME = "District_name";
    private static final String RIVER_NAME = "River_name";
    private static final String WIDTH = "Width";
    private static final String HEIGHT = "Height";
    private static final String DEPTH = "Depth";
    private static final String INFORMATION = "Information";
    private static final String ID = "Id";

    public int save(String District_name, String River_name, float Height, float Width, float Depth, String Information, int User_id) {
        Sql_connect sql_connect = new Sql_connect();

        Connection connection = sql_connect.connection();
        PreparedStatement statement = null;
        try {

            statement = connection.prepareStatement("INSERT INTO information_river(District_name,River_name,Height,Width, Depth ,Information, Created_by) values (?,?,?,?,?,?,?)");

            statement.setString(1, District_name);
            statement.setString(2, River_name);
            statement.setFloat(3, Height);
            statement.setFloat(4, Width);
            statement.setFloat(5, Depth);
            statement.setString(6, Information);
            statement.setInt(7, User_id);
            return statement.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();

        }
        return -1;
    }

    //Select * from information_river where Created_by=?
    public List<RiverBean> getRiverOfAUser(int id) {
        Sql_connect sql_connect = new Sql_connect();
        Connection connection = sql_connect.connection();
        PreparedStatement statement = null;
        boolean exitStatement = false;
        List<RiverBean> responseList = new ArrayList<>();
        try {
            statement = connection.prepareStatement(
                    "Select * from information_river where Created_by=? ");

            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                RiverBean response = new RiverBean();
                response.setDistrictName(resultSet.getString(DISTRICT_NAME));
                response.setRiverName(resultSet.getString(RIVER_NAME));
                response.setWidth(resultSet.getFloat(WIDTH));
                response.setHeight(resultSet.getFloat(HEIGHT));
                response.setDepth(resultSet.getFloat(DEPTH));
                response.setInformation(resultSet.getString(INFORMATION));
                response.setId(resultSet.getInt(ID));

                responseList.add(response);
            }


        } catch (Exception e) {
            System.out.println(e);
        }
        return responseList;
    }

    public List<RiverBean> getAllRiver() {
        Sql_connect sql_connect = new Sql_connect();
        Connection connection = sql_connect.connection();
        PreparedStatement statement = null;
        boolean exitStatement = false;
        List<RiverBean> responseList = new ArrayList<>();
        try {
            statement = connection.prepareStatement(
                    "Select * from information_river ");


            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                RiverBean response = new RiverBean();
                response.setDistrictName(resultSet.getString(DISTRICT_NAME));
                response.setRiverName(resultSet.getString(RIVER_NAME));
                response.setWidth(resultSet.getFloat(WIDTH));
                response.setHeight(resultSet.getFloat(HEIGHT));
                response.setDepth(resultSet.getFloat(DEPTH));
                response.setInformation(resultSet.getString(INFORMATION));
                response.setId(resultSet.getInt(ID));

                responseList.add(response);
            }


        } catch (Exception e) {
            System.out.println(e);
        }
        return responseList;
    }

    public List<String> getAllDistrict() {
        Sql_connect sql_connect = new Sql_connect();
        Connection connection = sql_connect.connection();
        PreparedStatement statement = null;
        boolean exitStatement = false;
        List<String> responseList = new ArrayList<>();
        try {
            statement = connection.prepareStatement(
                    "SELECT DISTINCT District_name FROM information_river; ");


            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                responseList.add(resultSet.getString(1));

            }


        } catch (Exception e) {
            System.out.println(e);
        }
        return responseList;
    }

    public List<RiverBean> getRiverOfADistrict(String district) {
        Sql_connect sql_connect = new Sql_connect();
        Connection connection = sql_connect.connection();
        PreparedStatement statement = null;
        boolean exitStatement = false;
        List<RiverBean> responseList = new ArrayList<>();
        try {
            statement = connection.prepareStatement(
                    "Select * from information_river where District_name=? ");

            statement.setString(1, district);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                RiverBean response = new RiverBean();
                response.setDistrictName(resultSet.getString(DISTRICT_NAME));
                response.setRiverName(resultSet.getString(RIVER_NAME));
                response.setWidth(resultSet.getFloat(WIDTH));
                response.setHeight(resultSet.getFloat(HEIGHT));
                response.setDepth(resultSet.getFloat(DEPTH));
                response.setInformation(resultSet.getString(INFORMATION));
                response.setId(resultSet.getInt(ID));

                responseList.add(response);
            }


        } catch (Exception e) {
            System.out.println(e);
        }
        return responseList;
    }

    public List<RiverBean> search(String key) {
        Sql_connect sql_connect = new Sql_connect();
        Connection connection = sql_connect.connection();
        PreparedStatement statement = null;
        List<RiverBean> responseList = new ArrayList<>();

        try {
            statement = connection.prepareStatement("select * from information_river where River_name like ?");
            statement.setString(1, key);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                RiverBean response = new RiverBean();
                response.setDistrictName(resultSet.getString(DISTRICT_NAME));
                response.setRiverName(resultSet.getString(RIVER_NAME));
                response.setWidth(resultSet.getFloat(WIDTH));
                response.setHeight(resultSet.getFloat(HEIGHT));
                response.setDepth(resultSet.getFloat(DEPTH));
                response.setInformation(resultSet.getString(INFORMATION));
                response.setId(resultSet.getInt(ID));

                responseList.add(response);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return responseList;
    }
}
