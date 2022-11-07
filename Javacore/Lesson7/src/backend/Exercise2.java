package backend;

import entity.MyMath;
import entity.ex2.Student;

import java.util.Scanner;

public class Exercise2 {
    public void question1() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap so a");
        int a = sc.nextInt();
        System.out.printf("Result: ");
        System.out.format("%f",MyMath.sum(a));

    }

    public void question2() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap id");
        int id = sc.nextInt();
        System.out.println("Nhap ten");
        String name = sc.next();
        Student st = new Student(id,name);
        System.out.println(st);
        int a = st.getId();
        System.out.println(a);
    }
}
