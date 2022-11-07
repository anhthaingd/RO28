package entity;

import java.util.ArrayList;
import java.util.Scanner;

public class Student {
    private int id;
    private String name;
    public static String college = "Dai hoc bach khoa";

    public static int moneyGroup;
    public static int COUNT = 0;
    Scanner sc = new Scanner(System.in);
    public Student() {
        super();
        COUNT ++;
        if (COUNT > 7) {
            System.err.println("So luong sinh vien dat gioi han");
        } else {
            this.id = COUNT;
            System.out.println("Nhap ten sinh vien: ");
            this.name = sc.next();
        }
    }
    @Override
    public String toString() {
        return "Student [id= " + id + ", name= " + name + ", college: " + college + "]";
    }
}
