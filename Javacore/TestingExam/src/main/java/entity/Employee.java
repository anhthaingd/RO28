package entity;

public class Employee extends User{
    private int projectId;
    private String proSkill;
    public Employee() {

    }
    public Employee(int id, String fullName, String email, String password, String typeUser,int projectId,String proSkill) {
        super(id,fullName,email,password,typeUser);
        this.projectId = projectId;
        this.proSkill = proSkill;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getProSkill() {
        return proSkill;
    }

    public void setProSkill(String proSkill) {
        this.proSkill = proSkill;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + getId() +
                ", fullName='" + getFullName() + '\'' +
                ", email='" + getEmail() + '\'' +
                "projectId=" + projectId +
                ", proSkill='" + proSkill + '\'' +
                '}';
    }
}
