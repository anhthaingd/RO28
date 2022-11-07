package entity.ex6Ques2_3;

public abstract class User {
    private String name;
    Double salaryRatio;

    public User(String name,Double salaryRatio) {
        this.name = name;
        this.salaryRatio = salaryRatio;
    }

    public abstract Double calculatePay();
    public void displayInf() {
        System.out.println("Name: " + name);
        System.out.println("Salary Ratio: " + salaryRatio);
        System.out.println("Calculate Pay: " + calculatePay());
    }
}

