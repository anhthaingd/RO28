package Lesson10;

import controller.DepartmentController;
import entity.Department;
import repository.DepartmentRepository;
import service.impl.DepartmentServiceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
//        DepartmentRepository repository = new DepartmentRepository();
//        DepartmentServiceimpl service = new DepartmentServiceimpl(repository);
//        DepartmentController controller = new DepartmentController(service);
//        System.out.println("Tao moi phong ban");
//        System.out.println("Nhap ten phong ban");
//        Scanner sc = new Scanner(System.in);
//        String departmentName = sc.next();
//        Department requestCreate = new Department();
//        requestCreate.setDepartmentName(departmentName);
//        controller.createDepartment(requestCreate);
//
//        System.out.println("Danh sach phong ban");
//        List<Department> departments = controller.getListDepartment();
//        for (Department department : departments) {
//            System.out.println(department);
//        }
        Exercise1 ex1 = new Exercise1();
        ex1.question1();
    }

}
