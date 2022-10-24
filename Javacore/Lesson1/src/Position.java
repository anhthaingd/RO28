public class Position {
    int positionId;
    String positionName;
    enum PositionName {
        DEV, TEST, SCRUM_MASTER, PM
    };
    @Override
    public String toString() {
        return  "Position{" +
                "id=" + positionId +
                ", name='" + positionName + "\'" +
                "}";
    }
}
