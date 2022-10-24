import java.sql.Date;
import java.time.LocalDate;
import java.util.Arrays;

public class Exam {
    int examId;
    String code;
    String title;
    CategoryQuestion[] categoryId;
    int duration;
    Account creatorId;
    LocalDate createDate;
    public  Question[] questionId;

    @Override
    public  String toString() {
        return  "Exam{" +
                "examId=" + examId +
                ", code='" + code + '\'' +
                ", title='" + title + '\'' +
                ", CategoryQuestion= " + Arrays.toString(categoryId) +
                ", duration=" + duration +
                ", createDate=" + createDate +
                ", questionId="+ Arrays.toString(questionId) +
                '}';
    }
}
