package controller;

import entity.Department;
import service.DepartmentService;

import java.util.ArrayList;
import java.util.List;

public class DepartmentController {
    private final DepartmentService departmentService;

    public DepartmentController(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }
    public List<Department> getListDepartment () {
        List<Department> departments = new ArrayList<>();
        try {
            departments = departmentService.getListDepartment();
        } catch (Exception e) {
            System.out.println("Lay danh sach Department ko thanh cong" + e.getMessage());
        }
        return departments;
    }

    public void createDepartment(Department request) {
        try {
            departmentService.createDepartment(request);
        } catch (Exception e) {
            System.out.println("Tao moi phong ban khong thanh cong"+ e.getMessage());
        }
    }
}
