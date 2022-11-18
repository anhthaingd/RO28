package service;

import entity.Position;

import java.sql.SQLException;
import java.util.List;

public interface PositionService {
    List<Position> getListPosition() throws SQLException;
    void createPosition() throws SQLException;
    void updatePosition() throws SQLException;
    void deletePosition() throws SQLException;
}
