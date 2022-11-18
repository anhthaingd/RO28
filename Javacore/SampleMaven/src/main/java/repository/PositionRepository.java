package repository;

import entity.Position;
import entity.PositionName;
import utils.DatabaseUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class PositionRepository {
    // Khai bao doi tuong Connection
    private final Connection con = DatabaseUtils.getInstance().getDatabaseConnection();
    public List<Position>  getListPosition() throws SQLException {
        List<Position> positions = new ArrayList<>();
        String sql = "SELECT * FROM `Position` ORDER BY PositionID";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        con.commit();
        while (rs.next()) {
            Position position = new Position();
            position.setPositionID(rs.getInt(1));
            String name = rs.getString(2);
            switch (name) {
                case "Dev":
                    position.setPositionName(PositionName.DEV);
                    break;
                case "Test":
                    position.setPositionName(PositionName.TEST);
                    break;
                case "Scrum Master":
                    position.setPositionName(PositionName.SCRUM_MASTER);
                    break;
                case "PM":
                    position.setPositionName(PositionName.PM);
                    break;
            }
            positions.add(position);
        }
        return positions;
    }

    public int createPosition() throws SQLException {
        String sql = "INSERT INTO `Position`(PositionName) VALUES (?)";
        PreparedStatement ps = con.prepareStatement(sql);
        String name = getName();
        ps.setString(1,name);
        int result = ps.executeUpdate();
        con.commit();
        return result;
    }

    private String getName() {
        Scanner sc = new Scanner(System.in);
        while (true) {
            System.out.println("1.Dev 2.Test 3.Scrum Master 4. PM");
            switch (sc.nextInt()) {
                case 1:
                    return "Dev";
                case 2:
                    return "Test";
                case 3:
                    return "Scrum Master";
                case 4:
                    return "PM";
                default:
                    System.out.println("Nhap lai");
                    break;
            }
        }
    }

    public int updatePosition() throws SQLException {
        String sql = "UPDATE `Position` SET PositionName = ? WHERE PositionID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        System.out.println("Chon ID can update");
        Scanner sc = new Scanner(System.in);
        int id = sc.nextInt();
        System.out.println("Nhap ten");
        String name = getName();
        ps.setString(1,name);
        ps.setInt(2,id);
        int result = ps.executeUpdate();
        con.commit();
        return result;

    }

    public int deletePosition() throws SQLException {
        String sql = "DELETE FROM `Position` WHERE PositionID = ?";
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap ID can xoa");
        int positionId = sc.nextInt();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,positionId);
        int result = ps.executeUpdate();
        con.commit();
        return result;
    }
}
