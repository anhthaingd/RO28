package controller;

import Lesson10.Exercise1;
import entity.Position;
import service.PositionService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionController {
    private final PositionService positionService;
    public PositionController(PositionService positionService) {
        this.positionService = positionService;
    }
    public List<Position> getListPosition() {
        List<Position> positions = new ArrayList<>();
        try {
            positions = positionService.getListPosition();
        } catch (Exception e) {
            System.out.println("Lay thong tin fails" + e.getMessage());
        }
        return positions;
    }

    public void createPosition() {
        try {
            positionService.createPosition();
        } catch (Exception e) {
            System.out.println("Tao position fails" + e.getMessage());
        }
    }

    public void updatePosition() {
        try {
            positionService.updatePosition();
        } catch (Exception e) {
            System.out.println("Update position fails" + e.getMessage());
        }
    }

    public void deletePosition() {
        try {
            positionService.deletePosition();
        } catch (SQLException e) {
            System.out.println("Delete fails" + e.getMessage());
        }
    }
}
