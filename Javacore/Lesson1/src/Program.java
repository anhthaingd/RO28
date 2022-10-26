
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

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
        acc1.groups = new Group[]{group2, group3};

        Account acc2 = new Account();
        acc2.id = 2;
        acc2.email = "messi@gmail.com";
        acc2.userName = "messi";
        acc2.fullName = "Lionel Messi";
        acc2.departmentId = dep2;
        acc2.positionId = pos2;
        acc2.createDate = LocalDate.now();
        acc2.groups = new Group[]{group1,group2};

        Account acc3 = new Account();
        acc3.id = 3;
        acc3.email = "neymar@gmail.com";
        acc3.userName = "neymar";
        acc3.fullName = "Neymar Junior";
        acc3.departmentId = dep3;
        acc3.positionId = pos3;
        acc3.createDate = LocalDate.now();
        acc3.groups = new Group[]{group1, group3};

        // Tao exam
        Exam exam1 = new Exam();
        exam1.examId = 1;
        exam1.code = "as3fsad";
        exam1.title = "bla bla";
        exam1.createDate = LocalDate.now();

        System.out.println("========== Thông tin các tài khoản ==========");
        System.out.println(acc1);
        System.out.println(acc2);
        System.out.println(acc3);

        group1.accounts = new Account[]{acc2,acc3};
        group2.accounts = new Account[]{acc1,acc2};
        group3.accounts = new Account[]{acc1,acc3};

        System.out.println("----------Exercise 1-------------");
        System.out.println("-------Question 1--------");

        if (acc2.departmentId == null)
        {
            System.out.println("Nhan vien chua co phong ban");
        } else {
            System.out.println("Phong ban cua nhan vien nay la: " + acc2.departmentId.departmentName);
        }

        System.out.println("-------Question 2--------");

        if (acc2.groups == null) {
            System.out.println("Nhan vien nay chua co group");
        } else {
            int countGroup = acc2.groups.length;
            if (countGroup == 1|| countGroup == 2) {
                System.out.println("Group cua nhan vien nay la Java Fresher, C# Fresher");
            } else if (countGroup == 3) {
                System.out.println("Nhan vien nay la nguoi quan trong, tham gia nhieu group");
            } else {
                System.out.println("Nhan vien nay la nguoi hong chuyen, tham gia tat ca group");
            }
        }

        System.out.println("-------Question 3--------");

        System.out.println(acc2.departmentId == null ?
                "Nhan vien nay chua co phong ban" :
                "Phong ban cua nhan vien nay la: " + acc2.departmentId.departmentName);

        System.out.println("-------Question 4--------");

        System.out.println(acc1.positionId.positionName == "DEV" ?
                "Day la Developer" :
                "Nguoi nay khong phai la Developer");

        System.out.println("-------Question 5--------");

        int countAccount =  group1.accounts.length;
        switch (countAccount) {
            case 1:
                System.out.println("Nhom co 1 thanh vien");
                break;
            case 2:
                System.out.println("Nhom co 2 thanh vien");
                break;
            case 3:
                System.out.println("Nhom co 3 thanh vien");
                break;
            default:
                System.out.println("Nhom co nhieu thanh vien");
                break;
        }

        System.out.println("-------Question 6--------");

        if (acc2.groups == null) {
            System.out.println("Nhan vien nay chua co group");
        } else {
            int countGroup = acc2.groups.length;
            switch (countGroup) {
                case 1:
                    System.out.println("Group cua nhan vien nay la Java Fresher, C# Fresher");
                    break;
                case 2:
                    System.out.println("Group cua nhan vien nay la Java Fresher, C# Fresher");
                    break;
                case 3:
                    System.out.println("Nhan vien nay la nguoi quan trong, tham gia nhieu group");
                    break;
                default:
                    System.out.println("Nhan vien nay la nguoi hong chuyen, tham gia tat ca group");
                    break;
            }
        }

        System.out.println("-------Question 7--------");

        switch (acc1.positionId.positionName) {
            case "DEV":
                System.out.println("Day la Developer");
                break;
            default:
                System.out.println("Day khong phai la Developer");
                break;
        }

        System.out.println("-------Question 8--------");

        Account[] accArray = {acc1,acc2,acc3};
        for (Account account1:accArray) {
            System.out.println("Email: " + account1.email + ", Fullname: " + account1.fullName + ", Ten phong ban: " + account1.positionId.positionName);
        }
        System.out.println("-------Question 9--------");

        Department[] depArray = {dep1,dep2,dep3};
        for (Department dep:depArray) {
            System.out.println("Id: " + dep.departmentId +"\nName: " + dep.departmentName);
        }

        System.out.println("-------Question 10-------");

        for (int i=0;i<accArray.length;i++) {
            System.out.println("Thong tin account thu " + (i+1) + " la: ");
            System.out.println("Email: " + accArray[i].email);
            System.out.println("Full name: " + accArray[i].fullName);
            System.out.println("Phong ban: " + accArray[i].departmentId.departmentName + "\n");
        }


        System.out.println("-------Question 11-------");

        for (int i=0;i<depArray.length;i++) {
            System.out.println("Thong tin department thu "+(i+1)+" la:");
            System.out.println("Id: "+depArray[i].departmentId );
            System.out.println("Name: "+depArray[i].departmentName +"\n");
        }

        System.out.println("-------Question 12-------");

        for (int i=0;i<2;i++) {
            System.out.println("Thong tin department thu "+(i+1)+" la:");
            System.out.println("Id: "+depArray[i].departmentId );
            System.out.println("Name: "+depArray[i].departmentName +"\n");
        }

        System.out.println("-------Question 13-------");

        for (int i=0;i<accArray.length;i++) {
            if (i!=1) {
                System.out.println("Thong tin account thu " + (i+1) + " la: ");
                System.out.println("Email: " + accArray[i].email);
                System.out.println("Full name: " + accArray[i].fullName);
                System.out.println("Phong ban: " + accArray[i].departmentId.departmentName + "\n");
            }

        }

        System.out.println("-------Question 14--------");


        for (int i=0;i<accArray.length;i++) {
            if (accArray[i].id < 4) {
                System.out.println("Thong tin account thu " + (i+1) + " la: ");
                System.out.println("Email: " + accArray[i].email);
                System.out.println("Full name: " + accArray[i].fullName);
                System.out.println("Phong ban: " + accArray[i].departmentId.departmentName + "\n");
            }

        }

        System.out.println("-------Question 15--------");

        for (int i = 0;i<=20;i++) {
            if (i%2==0) {
                System.out.print(i + " ");
            }
        }

        System.out.println("-------Question 16--------");
        int i =0;
        while (i<accArray.length) {
            if (i!=1) {
                System.out.println("Thong tin account thu " + (i+1) + " la: ");
                System.out.println("Email: " + accArray[i].email);
                System.out.println("Full name: " + accArray[i].fullName);
                System.out.println("Phong ban: " + accArray[i].departmentId.departmentName + "\n");
            }
            i++;
        }

        System.out.println("-------Question 17--------");
        i=0;
        do {
            if (i!=1) {
                System.out.println("Thong tin account thu " + (i+1) + " la: ");
                System.out.println("Email: " + accArray[i].email);
                System.out.println("Full name: " + accArray[i].fullName);
                System.out.println("Phong ban: " + accArray[i].departmentId.departmentName + "\n");
            }
            i++;
        } while (i<accArray.length);

        System.out.println("----------Exercise 2-------------");
        System.out.println("-------Question 1--------");

        int a = 5;
        System.out.printf("%d\n",a);

        System.out.println("-------Question 2--------");

        int b = 100000000;
        System.out.printf(Locale.US,"%,d\n",b);

        System.out.println("-------Question 3--------");

        double c = 5.567098;
        System.out.printf("%.4f%n",c);

        System.out.println("-------Question 4--------");

        String name = "Nguyen Van A";
        System.out.println("Ten toi la " +name+" va toi dang doc than.");

        System.out.println("-------Question 5--------");

        String pattern = "dd/MM/yyyy HH:mm:ss";
        SimpleDateFormat formatDate = new SimpleDateFormat(pattern);
        String date = formatDate.format(new Date());
        System.out.println(date);

        System.out.println("-------Question 6--------");

        System.out.print("Email\t\t\t\tFull Name\t\tTen phong ban\n");
        for (int j=0;j<accArray.length;j++) {
            System.out.println(accArray[j].email+"\t\t"+accArray[j].fullName+"\t\t"+accArray[j].departmentId.departmentName);
        }

        System.out.println("----------Exercise 3-------------");
        System.out.println("-------Question 1--------");

//        Locale locale = new Locale("vn","VN");
//        DateFormat dateformat = DateFormat.getDateInstance(DateFormat.DEFAULT,locale);
//        String date1 = dateformat.format(exam1.createDate);
//        System.out.println(exam1.code + ": "+ date1);

        System.out.println("-------Question 2--------");

//        String pattern1 = "yyyy-MM-dd HH-mm-ss";
//        SimpleDateFormat dateFormatExam = new SimpleDateFormat(pattern1);
//        String dateExam = dateFormatExam.format(exam1.createDate);
//        System.out.println(dateExam);

        System.out.println("-------Question 3--------");
        System.out.println("-------Question 4--------");
        System.out.println("-------Question 5--------");


        System.out.println("----------Exercise 4-------------");
        System.out.println("-------Question 1--------");

        Random random = new Random();
        int d = random.nextInt();
        System.out.println("So ngau nhien: " + d);

        System.out.println("-------Question 2--------");

        float e = random.nextFloat();
        System.out.println("So thuc ngau nhien: " + e);

        System.out.println("-------Question 3--------");

        String[] nameArr = {"Thai","Tuan Anh","Thang","Khanh"};
        int f = random.nextInt(nameArr.length);
        System.out.println(nameArr[f]);

        System.out.println("-------Question 4--------");

        int minDay = (int) LocalDate.of(1995,7,24).toEpochDay();
        int maxDay = (int) LocalDate.of(1995,12,20).toEpochDay();
        System.out.println("minDay: " + minDay);
        System.out.println("maxDay: " + maxDay);
        int randomInt = minDay + random.nextInt(maxDay-minDay);
        LocalDate randomDay = LocalDate.ofEpochDay(randomInt);
        System.out.println(randomDay);

        System.out.println("-------Question 5--------");

        int now = (int) LocalDate.now().toEpochDay();
        int randomD = now - random.nextInt(365);
        LocalDate q5 = LocalDate.ofEpochDay(randomD);
        System.out.println(q5);

        System.out.println("-------Question 6--------");

        int randomQ6 = random.nextInt(now);
        LocalDate q6 = LocalDate.ofEpochDay(randomQ6);
        System.out.println(q6);

        System.out.println("-------Question 7--------");

        int randomQ7 = random.nextInt(899);
        int q7 = 100 + randomQ7;
        System.out.println(q7);

        System.out.println("----------Exercise 5-------------");
        System.out.println("-------Question 1--------");

        //Exercise5.question1();

        System.out.println("-------Question 2--------");

        //Exercise5.question2();

        System.out.println("-------Question 3--------");

        //Exercise5.question3();

        System.out.println("-------Question 4--------");

        //Exercise5.question4();

        System.out.println("-------Question 5--------");

        //Exercise5.question5();

        System.out.println("-------Question 6--------");

        //Exercise5.question6();

        System.out.println("-------Question 7--------");

        //Exercise5.question7();

        System.out.println("-------Question 8--------");

        //Exercise5.question8();

        System.out.println("-------Question 9--------");

        //Exercise5.question9();

        System.out.println("-------Question 10-------");

        //Exercise5.question10();

        System.out.println("----------Exercise 6-------------");
        System.out.println("-------Question 1--------");

        //Exercise6.question1();

        System.out.println("-------Question 2--------");

        Exercise6.question2();

        System.out.println("-------Question 3--------");

        Exercise6.question3();
    }

}
