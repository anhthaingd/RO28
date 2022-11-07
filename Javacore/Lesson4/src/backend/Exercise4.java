package backend;

import entity.Circle;
import entity.Student;

import javax.crypto.Cipher;

public class Exercise4 {
    public static void all() {
        question1();
        question2();
    }

    public static void question1() {
        Student st = new Student("anh thai","nghe an");
        Student st1 = new Student("thai","nghean");
        Student st2 = new Student(7f);
        st.plusScore(4.8f);
        st.plusScore(5.2f);
        System.out.println(st);
        System.out.println(st1);
        System.out.println(st2);
    }

    public static void question2() {
        System.out.println("--------Demo Circle-----------");
        Circle circle = new Circle(3,"blue");
        System.out.println("Dien tich hinh tron la: " + circle.getArea());
    }

}
