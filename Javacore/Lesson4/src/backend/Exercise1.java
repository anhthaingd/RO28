package backend;

import entity.Account;
import entity.Department;
import entity.Group;
import entity.Position;

import java.time.LocalDate;

public class Exercise1 {
    public static void all() {
        question1();
        question2();
        question3();
    }

    public static void question1() {
        Department dep = new Department();
        Department dep1 = new Department("Dep1");
        System.out.println(dep + "\n" + dep1);
    }

    public static void question2() {
        Account acc = new Account();
        Position pos1 = new Position();
        Account acc1 = new Account(1,"anhthaingd@gmail.com","alo","anh","thai");
        Account acc2 = new Account(2,"asfd@gmail.com","nguyenvana","cristiano ","ronaldo",pos1);

        System.out.println(acc + "\n" + acc1 + "\n" + acc2);
    }

    public static void question3() {
        Group gr1 = new Group();
        Account acc = new Account();
        Position pos1 = new Position();
        Account acc1 = new Account(1,"anhthaingd@gmail.com","alo","anh","thai");
        Account acc2 = new Account(2,"asfd@gmail.com","nguyenvana","cristiano ","ronaldo",pos1);
        Account[] accArray = {acc1,acc2};
        Group gr2 = new Group("Group2",acc,accArray, LocalDate.now());
        System.out.println(gr1 + "\n" + gr2);
    }
}
