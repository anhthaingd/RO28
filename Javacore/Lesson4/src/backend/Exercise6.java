package backend;

import entity.Phone;
import entity.VietnamesePhone;
import entity.ex6Ques2_3.Employee;
import entity.ex6Ques2_3.Manager;
import entity.ex6Ques2_3.User;
import entity.ex6Ques2_3.Waiter;

import java.util.Scanner;

public class Exercise6 {
    Scanner sc;
    public Exercise6() {
        sc = new Scanner(System.in);
    }

    public void question1() {
        loadmenuAbstract();
    }

    private void loadmenuAbstract() {
        VietnamesePhone vnPhone = new VietnamesePhone();
        while (true) {
            System.out.println("===========MENU===========");
            System.out.println("1: Insert Contact");
            System.out.println("2. Delete Contact");
            System.out.println("3. Update Contact");
            System.out.println("4. Search Contact");
            System.out.println("5. Print Contact");
            System.out.println("6. Finish");
            System.out.println("Choose function: ");
            int choose = sc.nextInt();
            switch (choose) {
                case 1:
                    System.out.println("Insert name: ");
                    String name = sc.next();
                    System.out.println("Insert number: ");
                    String number = sc.next();
                    vnPhone.insertContact(name,number);
                    break;
                case 2:
                    System.out.println("Insert name to delete: ");
                    String name1 = sc.next();
                    vnPhone.removeContact(name1);
                    break;
                case 3:
                    System.out.println("Insert name to update: ");
                    String name2 = sc.next();
                    System.out.println("Insert new number: ");
                    String newNum = sc.next();
                    vnPhone.updateContact(name2, newNum);
                    break;
                case 4:
                    System.out.println("Insert name to find: ");
                    String name3 = sc.next();
                    if (vnPhone.searchContact(name3) == false) {
                        System.out.println("Not found this name");
                    } else {
                        System.out.println("Find successfully");
                    }
                    break;
                case 5:
                    vnPhone.printContact();
                    break;
                case 6:
                    System.out.println("==========THANKS==========");
                    return;
                default:
                    System.out.println("Please select one of functions");
                    break;

            }
        }
    }

    public void question2() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap ten User: ");
        String name = sc.next();
        System.out.println("Nhap luong: ");
        Double salary = sc.nextDouble();
        User us1 = new User(name, salary) {

            @Override
            public Double calculatePay() {
                return null;
            }
        };
        us1.displayInf();
    }

    public void question3() {
        while(true) {
            System.out.println("=======MENU=======");
            System.out.println("1: Them employee");
            System.out.println("2: Them Manager");
            System.out.println("3: Them Waiter");
            System.out.println("4: Thoat");
            Scanner sc = new Scanner(System.in);
            int choose = sc.nextInt();
            switch (choose) {
                case 1:
                    System.out.println("Nhap ten employee: ");
                    String name = sc.next();
                    System.out.println("Nhap vao SalaryRatio: ");
                    Double emSalary = sc.nextDouble();
                    Employee em = new Employee(name,emSalary);
                    em.displayInf();
                    break;
                case 2:
                    System.out.println("Nhap ten Manager: ");
                    String name1= sc.next();
                    System.out.println("Nhap vao SalaryRatio: ");
                    Double mangerSalary = sc.nextDouble();
                    Manager mn = new Manager(name1,mangerSalary);
                    mn.displayInf();
                    break;
                case 3:
                    System.out.println("Nhap ten Waiter: ");
                    String name2= sc.next();
                    System.out.println("Nhap vao SalaryRatio: ");
                    Double waiterSalary = sc.nextDouble();
                    Waiter wt = new Waiter(name2,waiterSalary);
                    wt.displayInf();
                    break;
                case 4:
                    System.out.println("Bye bye");
                    return;
            }
        }
    }
}
