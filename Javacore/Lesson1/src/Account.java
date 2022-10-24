import java.sql.Date;
import java.time.LocalDate;
import java.util.Arrays;

public class Account {
    int id;
    String email;
    String userName;
    String fullName;
    Department departmentId;
    Position positionId;
    LocalDate createDate;
    Group[] groups;

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                ", fullName='" + fullName + '\'' +
                ", departmentId=" + departmentId +
                ", positionId=" + positionId +
                ", createDate=" + createDate +
                ", groups=" + Arrays.toString(groups) +
                '}';
    }
}
