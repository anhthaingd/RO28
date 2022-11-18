package repository;

import entity.Employee;
import entity.Manager;
import entity.User;
import util.DatabaseUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class UserRepository {
    private final Connection con = DatabaseUtils.getInstance().getDatabaseConnection();
    public List<User> getListUserByProjectId() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM `User` WHERE project_id = ? AND `role` IN('Manage','Employee')";
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap ProjectId: ");
        int projectId = sc.nextInt();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,projectId);
        ResultSet rs = ps.executeQuery();
//        con.commit();
        while (rs.next()) {
//            int id = rs.getInt(1);
//            String name = rs.getString(2);
//            System.out.format("%-10d%-20s\n",id,name);


            if (rs.getString(7).equals("Manage")) {
                Manager manager = new Manager();
                manager.setTypeUser("Manage");
                manager.setExplnYear(rs.getInt(5));
                users.add(manager);
            } else {
                Employee employee = new Employee();
                employee.setTypeUser("Employee");
                employee.setProSkill(rs.getString(6));
                users.add(employee);
            }
        }
        return users;
    }
}
