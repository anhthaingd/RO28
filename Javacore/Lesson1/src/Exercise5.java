import java.time.LocalDate;
import java.util.Scanner;

public  class Exercise5 {
    public static void question1() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap 3 so nguyen");
        System.out.println("So nguyen thu nhat: ");
        int a = sc.nextInt();
        System.out.println("So nguyen thu hai: ");
        int b = sc.nextInt();
        System.out.println("So nguyen thu ba: ");
        int c = sc.nextInt();
        System.out.println("Ban da nhap vao 3 so nguyen: " + a + ","+ b +"," + c );
    }

    public static void question2() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap so thuc thu nhat: ");
        float a = sc.nextFloat();
        System.out.println("Nhap so thuc thu hai: ");
        float b = sc.nextFloat();
        System.out.println("Ban da nhap 2 so thuc: " + a + ", "+ b);
    }

    public static void question3() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap ho: ");
        String q3 = sc.next();
        System.out.println("Nhap ten: ");
        String q33 = sc.next();
        System.out.println("Ho va ten la: " + q3 + " " + q33);

    }

    public static void question4() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap nam: ");
        int y = sc.nextInt();
        System.out.println("Nhap thang: ");
        int m = sc.nextInt();
        System.out.println("Nhap ngay: ");
        int d = sc.nextInt();
        LocalDate dateBirth = LocalDate.of(y,m,d);
        System.out.println("Ngay sinh nhat: " + dateBirth);
    }

    public static void question5() {
        Account acc4 = new Account();
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap id: ");
        acc4.id = sc.nextInt();
        System.out.println("Nhap email: ");
        acc4.email = sc.next();
        System.out.println("Nhap username: ");
        acc4.userName = sc.next();
        System.out.println("Nhap fullname: ");
        acc4.fullName = sc.next();
        System.out.println("Nhap chuc vu (int): ");
        int posNum = sc.nextInt();
        switch (posNum) {
            case 1:
                Position pos1 = new Position();
                pos1.positionName = "DEV";
                acc4.positionId = pos1;
                break;
            case 2:
                Position pos2 = new Position();
                pos2.positionName = "TEST";
                acc4.positionId = pos2;
                break;
            case 3:
                Position pos3 = new Position();
                pos3.positionName = "SCRUM_MASTER";
                acc4.positionId = pos3;
                break;
            case 4:
                Position pos4 = new Position();
                pos4.positionName = "PM";
                acc4.positionId = pos4;
                break;
        }
        System.out.println(acc4);
    }

    public static void question6() {
        Department dep = new Department();
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap id: ");
        dep.departmentId = sc.nextInt();
        System.out.println("Nhap name: ");
        dep.departmentName = sc.next();
        System.out.println(dep);
    }

    public static void question7() {
        System.out.println("Nhap vao so chan: ");
        Scanner sc = new Scanner(System.in);
        while (true) {
            int q7 = sc.nextInt();
            if (q7%2==0) {
                System.out.println("So chan vua nhap: " + q7);
                return;
            }
            else {
                System.out.println("Nhap lai");
            }
        }
    }

    public static void question8() {
        int count;
        do {
            count = 0;
            System.out.println("Nhap chuc nang: ");
            Scanner sc = new Scanner(System.in);
            int n = sc.nextInt();
            switch (n) {
                case 1:
                    question5();
                    count ++;
                    break;
                case 2:
                    question6();
                    count ++;
                    break;
                default:
                    System.out.println("Moi ban nhap lai");
                    break;
            }
        } while (count==0);
    }

    public static void question9() {
        Scanner sc = new Scanner(System.in);
        Group group2 = new Group();
        group2.groupId = 1;
        group2.groupName = "Developer";
        group2.createDate = LocalDate.of(2022,1,11);

        Group group1 = new Group();
        group1.groupId = 2;
        group1.groupName = "Test";
        group1.createDate = LocalDate.of(2021,1,23);

        Group group3 = new Group();
        group3.groupId = 3;
        group3.groupName = "Sale";
        group3.createDate = LocalDate.of(2012,1,14);

        // Tạo Account
        Account acc1 = new Account();
        acc1.id = 1;
        acc1.email = "ronaldo@gmail.com";
        acc1.userName = "ronaldo";
        acc1.fullName = "Cristiano Ronaldo";
        acc1.createDate = LocalDate.now();
        acc1.groups = new Group[]{group2, group3};

        Account acc2 = new Account();
        acc2.id = 2;
        acc2.email = "messi@gmail.com";
        acc2.userName = "messi";
        acc2.fullName = "Lionel Messi";
        acc2.createDate = LocalDate.now();
        acc2.groups = new Group[]{group1,group2};

        Account acc3 = new Account();
        acc3.id = 3;
        acc3.email = "neymar@gmail.com";
        acc3.userName = "neymar";
        acc3.fullName = "Neymar Junior";
        acc3.createDate = LocalDate.now();
        acc3.groups = new Group[]{group1, group3};

        Account[] accArray = {acc1,acc3,acc2};
        Group[] grArray = {group1,group2,group3};
        System.out.println("Ten cac username: ");
        for (int i =0;i<accArray.length;i++) {
            System.out.println(accArray[i].userName);
        }
        System.out.println("Nhap vao ten username: ");
        String username = sc.next();
        System.out.println("Ten cac group: ");
        for (int i =0;i<grArray.length;i++) {
            System.out.println(grArray[i].groupName);
        }
        System.out.println("Nhap ten group: ");
        String groupName = sc.next();
        int j = 0,indexGroup = -1;
        do {
            if (grArray[j].groupName.equals(groupName)) {
                indexGroup = j;
            }
            j++;
        } while (j<grArray.length);

        int k = 0,indexAccount = -1;
        do {
            if (accArray[k].userName.equals(username)) {
                indexAccount = k;
            }
            k++;
        } while (k<grArray.length);

        if (indexGroup < 0 || indexAccount < 0) {
            System.out.println("Nhap sai");
        } else {
            for (int m=0;m<accArray.length;m++) {
                if (accArray[m].userName.equals(username)) {
                    Group[] gpAdd = {grArray[indexGroup]};
                    accArray[m].groups = gpAdd;
                    System.out.println(accArray[m]);
                }
            }
        }
    }

    public static void question10() {
        int count;
        do {
            count = 0;
            System.out.println("Nhap chuc nang: ");
            Scanner sc = new Scanner(System.in);
            int n = sc.nextInt();
            switch (n) {
                case 1:
                    question5();
                    break;
                case 2:
                    question6();
                    break;
                case 3:
                    question9();
                    break;
                default:
                    System.out.println("Moi ban nhap lai");
                    break;
            }
            System.out.println("Ban co muon thuc hien chuc nang khac: ");
            int choose = sc.nextInt();
            if (choose==0) {
                count ++;
            }
        } while (count==0);
    }

}
