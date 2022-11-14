import controller.DepartmentController;
import entity.Department;
import repository.DepartmentRepository;
import service.impl.DepartmentServiceimpl;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        DepartmentRepository repository = new DepartmentRepository();
        DepartmentServiceimpl service = new DepartmentServiceimpl(repository);
        DepartmentController controller = new DepartmentController(service);
        System.out.println("Danh sach phong ban");
        List<Department> departments = controller.getListDepartment();
        for (Department department : departments) {
            System.out.println(department);
        }
    }
}
