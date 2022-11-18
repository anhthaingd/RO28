package entity;

public class Manager extends User{
    private int explnYear;
    private int projectId;
    public Manager() {

    }
    public Manager(int id, String fullName, String email, String password, String typeUser,int explnYear,int projectId) {
        super(id,fullName,email,password,typeUser);
        this.explnYear = explnYear;
        this.projectId = projectId;
    }

    public int getExplnYear() {
        return explnYear;
    }

    public void setExplnYear(int explnYear) {
        this.explnYear = explnYear;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "id=" + getId() +
                ", fullName='" + getFullName() + '\'' +
                ", email='" + getEmail() + '\'' +
                "explnYear=" + explnYear +
                ", projectId=" + projectId +
                '}';
    }
}
