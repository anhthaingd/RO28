package backend;

import entity.Staff;
import entity.Worker;

public class Exercise5 {
    public static void all() {
        question1();
    }

    public static void question1() {
        Staff st = new Staff("Anh Thai",10, Staff.Gender.MALE,"Nghe An");
        Worker worker = new Worker("alo",10, Staff.Gender.FEMALE,"d",9);
        System.out.println(st);
        System.out.println(worker);
    }
}

