package entity.ex2;

public class Student {
    private final int id;
    private String name;

    public Student (int id,String name) {
        super();
        this.id = id ;
        this.name = name;
    }

    public int getId () {
        return this.id;
    }

    public static void study() {
        System.out.println("Dang hoc bai...");
    }
    @Override
    public String toString() {
        return "Student[id = " + id + ", name= " + name +"]";
    }
}
