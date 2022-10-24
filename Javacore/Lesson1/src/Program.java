import java.time.LocalDate;

public class Program {
    public static void main(String[] args) {
        // Tạo Department
        Department dep1 = new Department();
        dep1.departmentId = 1;
        dep1.departmentName = "Marketing";

        Department dep2 = new Department();
        dep2.departmentId = 2;
        dep2.departmentName = "Sale";

        Department dep3 = new Department();
        dep3.departmentId = 3;
        dep3.departmentName = "BOD";

        System.out.println("========== Thông tin các phòng ban ==========");
        System.out.println(dep1);
        System.out.println(dep2);
        System.out.println(dep3);

        // Tạo position
        Position pos1 = new Position();
        pos1.positionId = 1;
        pos1.positionName = "DEV";

        Position pos2 = new Position();
        pos2.positionId = 2;
        pos2.positionName = "TEST";

        Position pos3 = new Position();
        pos3.positionId = 3;
        pos3.positionName = "SCRUM_MASTER";

        Position pos4 = new Position();
        pos4.positionId = 4;
        pos4.positionName = "PM";

        System.out.println("========== Thông tin các vị trí công việc ==========");
        System.out.println(pos1);
        System.out.println(pos2);
        System.out.println(pos3);
        System.out.println(pos4);

        // Tạo Group
        Group group2 = new Group();
        group2.groupId = 1;
        group2.groupName = "Developer";

        Group group1 = new Group();
        group1.groupId = 2;
        group1.groupName = "Test";

        Group group3 = new Group();
        group3.groupId = 3;
        group3.groupName = "Sale";

        // Tạo Account
        Account acc1 = new Account();
        acc1.id = 1;
        acc1.email = "ronaldo@gmail.com";
        acc1.userName = "ronaldo";
        acc1.fullName = "Cristiano Ronaldo";
        acc1.departmentId = dep1;
        acc1.positionId = pos1;
        acc1.createDate = LocalDate.now();
        acc1.groups = new Group[]{group1, group2};

        Account acc2 = new Account();
        acc2.id = 2;
        acc2.email = "messi@gmail.com";
        acc2.userName = "messi";
        acc2.fullName = "Lionel Messi";
        acc2.departmentId = dep2;
        acc2.positionId = pos2;
        acc2.createDate = LocalDate.now();
        acc2.groups = new Group[]{group2, group3};

        Account acc3 = new Account();
        acc3.id = 3;
        acc3.email = "neymar@gmail.com";
        acc3.userName = "neymar";
        acc3.fullName = "Neymar Junior";
        acc3.departmentId = dep3;
        acc3.positionId = pos3;
        acc3.createDate = LocalDate.now();
        acc3.groups = new Group[]{group1, group3};

        System.out.println("========== Thông tin các tài khoản ==========");
        System.out.println(acc1);
        System.out.println(acc2);
        System.out.println(acc3);
    }
}
