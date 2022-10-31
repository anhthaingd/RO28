package entity;

import java.security.PublicKey;
public class Student {
    public final String HOMETOWN = "Nghe An";
    private int id;
    private String name;
    private String hometown;
    private float score;

    public Student () {

    }

    public Student (String name,String hometown) {
        this.name = name;
        this.hometown = hometown;
        this.score = (float) 0;
    }

    public Student (Float score) {
        this.score = score;
    }


    @Override
    public String toString() {
        String rank = null;
        if (this.score <4) {
            rank = "Yeu";
        } else if (this.score<6) {
            rank = "Trung binh";
        } else if (this.score<8) {
            rank = "Kha";
        } else {
            rank = "Gioi";
        }
        return "Student{" +
                "Name: " + name +
                ", Hometown: " + hometown +
                ", Score: " + score +
                ", Rank: " + rank
                +"}";
    }
    public void plusScore (Float score) {
        this.score = this.score + score;
    }


}
// khong co static thi la thanh vien doi tuong
// co static la thanh vien lop
// final la hang, neu co static la hang cua lop con khong la hang cua doi tuong

