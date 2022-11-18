package Lesson10;

import controller.DepartmentController;
import repository.DepartmentRepository;
import service.impl.DepartmentServiceimpl;

import java.util.Scanner;

public class Exercise2 {
    DepartmentRepository repository = new DepartmentRepository();
    DepartmentServiceimpl  service = new DepartmentServiceimpl(repository);
    DepartmentController  controller = new DepartmentController(service);
    public void crud() {
        Scanner sc = new Scanner(System.in);
        while(true) {
            menu();
            int choose = sc.nextInt();
            switch (choose) {
                case 1:
                    controller.getListDepartment();
                    break;
                case 2:

            }
        }
    }
    public void menu() {
        System.out.println("1. Danh sach Department");
        System.out.println("2. Get Department By Id");
        System.out.println("3. Check DepartmentName exists");
        System.out.println("4. Create Department");
        System.out.println("5. Out");
        System.out.println("Chon chuc nang: ");
    }
}
