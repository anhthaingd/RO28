import java.sql.Date;
import java.time.LocalDate;

public class Question {
    int questionId;
    String content;
    TypeQuestion typeId;
    Account creatorId;
    LocalDate createDate;

    @Override
    public String toString() {
        return "Question{" +
                "questionId=" + questionId +
                ", content='" + content + '\'' +
                ", typeId=" + typeId +
                ", creatorId=" + creatorId +
                ", createDate=" + createDate +
                '}';
    }
}

public  class Main {
    
}