import java.time.LocalDate;

public class Exercise6 {
    public static void question1() {
        for (int i=0;i<=10;i++) {
            if (i%2==0) {
                System.out.print(i+" ");
            }
        }
    }

    public static void question2() {
        Account acc1 = new Account();
        acc1.id = 1;
        acc1.email = "ronaldo@gmail.com";
        acc1.userName = "ronaldo";
        acc1.fullName = "Cristiano Ronaldo";
        acc1.createDate = LocalDate.now();

        Account acc2 = new Account();
        acc2.id = 2;
        acc2.email = "messi@gmail.com";
        acc2.userName = "messi";
        acc2.fullName = "Lionel Messi";
        acc2.createDate = LocalDate.now();

        Account acc3 = new Account();
        acc3.id = 3;
        acc3.email = "neymar@gmail.com";
        acc3.userName = "neymar";
        acc3.fullName = "Neymar Junior";
        acc3.createDate = LocalDate.now();
        printAccount(acc1);
        printAccount(acc2);
        printAccount(acc3);

    }

    public static void printAccount(Account account) {
        System.out.println("Id: " + account.id + "\n" + "Email: " + account.email + "\n");
    }
    public static void question3() {
        for (int i =0;i<10;i++) {
            System.out.print(i+ " ");
        }
    }
}
