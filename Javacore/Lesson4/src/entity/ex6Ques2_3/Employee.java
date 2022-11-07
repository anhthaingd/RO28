package entity.ex6Ques2_3;

public class Employee extends User {
    public Employee(String name,Double salaryRatio) {
        super(name,salaryRatio);
    }
    @Override
    public Double calculatePay() {
        return salaryRatio*420;
    }

}
