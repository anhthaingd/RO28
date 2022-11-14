package service.impl;

import entity.Department;
import repository.DepartmentRepository;
import service.DepartmentService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepartmentServiceimpl implements DepartmentService {

    public final DepartmentRepository departmentRepository;
    public DepartmentServiceimpl(DepartmentRepository departmentRepository) {
        this.departmentRepository = departmentRepository;
    }
    @Override
    public List<Department> getListDepartment() throws SQLException {
        List<Department> departments = new ArrayList<>();
        DepartmentRepository departmentRepository = new DepartmentRepository();
        departments = departmentRepository.getListDepartment();
        return departments;
    }
}
