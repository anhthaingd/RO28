package entity;

public class SecondaryStudent extends Student {
    public static int COUNT = 0;
    public SecondaryStudent () {
        super();
        COUNT++;
    }
}
