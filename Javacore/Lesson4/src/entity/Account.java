package entity;

import java.time.LocalDate;
import java.util.Arrays;

public class Account {
    private int id;
    private String email;
    private String userName;
    private String fullName;
    private Department departmentId;
    private Position positionId;
    private LocalDate createDate;
    private Group[] groups;

    public Account() {

    }

    public Account(int id, String email, String userName, String fullName, Department departmentId, Position positionId, LocalDate createDate, Group[] groups) {
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.fullName = fullName;
        this.departmentId = departmentId;
        this.positionId = positionId;
        this.createDate = createDate;
        this.groups = groups;
    }

    public Account(int id, String email, String userName, String fistName, String lastName) {
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.fullName = fistName.concat(lastName);
    }

    public Account(int id, String email, String userName, String fistName, String lastName,Position positionId) {
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.fullName = fistName.concat(lastName);
        this.positionId = positionId;
        this.createDate = LocalDate.now();
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getUserName() {
        return userName;
    }

    public String getFullName() {
        return fullName;
    }

    public Department getDepartmentId() {
        return departmentId;
    }

    public Position getPositionId() {
        return positionId;
    }

    public LocalDate getCreateDate() {
        return createDate;
    }

    public Group[] getGroups() {
        return groups;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setDepartmentId(Department departmentId) {
        this.departmentId = departmentId;
    }

    public void setPositionId(Position positionId) {
        this.positionId = positionId;
    }

    public void setCreateDate(LocalDate createDate) {
        this.createDate = createDate;
    }

    public void setGroups(Group[] groups) {
        this.groups = groups;
    }

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

    public Account(int id) {
        this.id = id;
    }
}
