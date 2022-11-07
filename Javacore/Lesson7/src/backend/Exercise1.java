package backend;

import entity.PrimaryStudent;
import entity.SecondaryStudent;
import entity.Student;

import javax.swing.text.Style;
import java.util.Scanner;

public class Exercise1 {
    public void question1() {
        Student[] studentArray = new Student[3];
        System.out.println("Khoi tao 3 sinh vien");
        for (int i = 0; i<3;i++) {
            Student st = new Student();
            studentArray[i] = st;
        }
        System.out.println("Thong tin sinh vien vua nhap");
        for (int i =0;i<3;i++) {
            System.out.println("Sinh vien " + (i+1)+ ": ");
            System.out.println(studentArray[i]);
        }
        System.out.println("Thong tin sau khi chuyen sang Dai hoc Cong nghe");
        Student.college = "Dai hoc cong nghe";
        for (int i =0;i<3;i++) {
            System.out.println("Sinh vien " + (i+1)+ ": ");
            System.out.println(studentArray[i]);
        }
    }

    public void question2() {
        Student[] studentArray = new Student[3];
        System.out.println("Khoi tao 3 sinh vien");
        for (int i=0;i<3;i++) {
            Student st = new Student();
            studentArray[i] = st;
        }
        System.out.println("Tong quy: " + (Student.moneyGroup+=300));
        System.out.println("Sau khi Student 1 mua, tong quy: " + (Student.moneyGroup-=50));
        System.out.println("Sau khi Student 2 mua, tong quy: " + (Student.moneyGroup-=20));

    }

    public void question3() {
        int a,b;
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap so a: ");
        a = sc.nextInt();
        System.out.println("Nhap so b: ");
        b = sc.nextInt();
        System.out.println("Max: " + (myMath.max(a,b)));
        System.out.println("Min: " + (myMath.min(a,b)));
        System.out.println("Sum: " + (myMath.sum(a,b)));
    }

    public String getCollect() {
        return Student.college;
    }
    public void question4() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap college moi: ");
        String collegeChange = sc.next();
        Student.college = collegeChange;
        Student st = new Student();
        System.out.println(st);
        System.out.println("Lay college: ");
        System.out.println(getCollect());
    }

    public void question5() {
        System.out.println("Khoi tao sinh vien");
        for (int i =0;i<3;i++) {
            System.out.println("Student " + (i+1));
            Student st = new Student();
        }

        Student st1 = new Student();
        Student st2 = new Student();
        System.out.println("Tong so sinh vien: " + Student.COUNT);
    }

    public void question6() {
        System.out.println("Tao 2 Primary Student");
        PrimaryStudent ps1 = new PrimaryStudent();
        PrimaryStudent ps2 = new PrimaryStudent();
        System.out.println("Tao 4 Secondary Student");
        SecondaryStudent ss1 = new SecondaryStudent();
        SecondaryStudent ss2 = new SecondaryStudent();
        SecondaryStudent ss3 = new SecondaryStudent();
        SecondaryStudent ss4 = new SecondaryStudent();
        String leftAlignFormat = "%-18s%-4d%n";
        System.out.format("%-18s%-4s%n","Category","SL");
        System.out.format(leftAlignFormat,"Student",Student.COUNT);
        System.out.format(leftAlignFormat,"PrimaryStudent",PrimaryStudent.COUNT);
        System.out.format(leftAlignFormat,"SecondaryStudent",SecondaryStudent.COUNT);
    }

    public void question7() {
        for (int i = 0;i<6;i++) {
            Student st = new Student();
        }
        System.out.println("Tao Primary Student");
        PrimaryStudent ps = new PrimaryStudent();
        System.out.println(ps);
        System.out.println("Tao Secondary Student");
        SecondaryStudent ss = new SecondaryStudent();
        System.out.println(ss);
    }
}
