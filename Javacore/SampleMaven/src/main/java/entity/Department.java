package entity;

public class Department {
    private int departmentId;
    private String departmentName;

    public Department () {

    }
    public Department (int departmentID,String departmentName) {
        this.departmentId = departmentID;
        this.departmentName = departmentName;
    }

    public int getDepartmentId () {
        return this.departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    @Override
    public String toString() {
        return "Department[DepartmentId: " + this.departmentId + ", DepartmentName: " + this.departmentName + "]";
    }
}
