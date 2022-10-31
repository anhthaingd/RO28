package backend;

import entity.Student;

public class Exercise4 {
    public static void all() {
        question1();

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


}
