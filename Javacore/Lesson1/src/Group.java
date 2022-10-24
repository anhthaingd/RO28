import java.sql.Date;
import java.time.LocalDate;
import java.util.Arrays;

public class Group {
    int groupId;
    String groupName;
    Account creatorId;
    LocalDate createDate;
    Account[] accounts;

    @Override
    public String toString() {
        return "Group{" +
                "groupId=" + groupId +
                ", groupName='" + groupName + '\'' +
                ", creatorId=" + creatorId +
                ", createDate=" + createDate +
                ", accounts=" + Arrays.toString(accounts) +
                '}';
    }
}
