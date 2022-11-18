package entity;

import javafx.geometry.Pos;

public class Position {
    private int positionID ;
    private PositionName positionName;


    public Position() {

    }
    public Position(int positionID,PositionName positionName) {
        this.positionID = positionID;
        this.positionName = positionName;
    }
    public int getPositionID() {
        return this.positionID;
    }
    public void setPositionID(int positionID) {
        this.positionID = positionID;
    }
    public PositionName getPositionName() {
        return this.positionName;
    }
    public void setPositionName(PositionName name) {
        this.positionName = name;
    }

    @Override
    public String toString() {
        return "Position{" +
                "positionID=" + positionID +
                ", positionName='" + positionName + '\'' +
                '}';
    }
}
