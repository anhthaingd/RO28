package service;

import entity.Department;

import java.sql.SQLException;
import java.util.List;

public interface DepartmentService {
    // Tạo interface để thể hiện tính trừu tường (tạo đầu tiên)
    List<Department> getListDepartment() throws SQLException;
    void createDepartment(Department request) throws SQLException;
    void getDepartmentById() throws SQLException;
}
