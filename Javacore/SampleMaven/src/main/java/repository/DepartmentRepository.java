package repository;

import entity.Department;
import utils.DatabaseUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartmentRepository {
    // Khai báo đối tượng Connection để kết nối đến CSDL
    private final Connection con = DatabaseUtils.getInstance().getDatabaseConnection();
    public List<Department> getListDepartment() throws SQLException {
        List<Department> departments = new ArrayList<>();
        String sql = "SELECT * FROM `Department` ORDER BY DepartmentID";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        con.commit();
        while(rs.next()) {
            Department department = new Department();
            department.setDepartmentId(rs.getInt(1));
            department.setDepartmentName(rs.getString(2));
            departments.add(department);
        }
        return departments;
    }

    public int createDepartment(Department request) throws SQLException {
        String sql = "INSERT INTO `Department`(DepartmentName) VALUES (?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,request.getDepartmentName());
        int result = ps.executeUpdate();
        con.commit();
        return result;
    }
}
