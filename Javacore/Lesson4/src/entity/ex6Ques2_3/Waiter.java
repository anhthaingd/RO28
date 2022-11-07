package entity.ex6Ques2_3;

public class Waiter extends User {
    public Waiter (String name,Double salaryRatio) {
        super(name,salaryRatio);
    }
    @Override
    public Double calculatePay() {
        return salaryRatio*220;
    }
}
