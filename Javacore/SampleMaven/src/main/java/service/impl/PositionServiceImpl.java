package service.impl;

import entity.Position;
import repository.PositionRepository;
import service.PositionService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionServiceImpl implements PositionService {
    public final PositionRepository positionRepository;
    public PositionServiceImpl(PositionRepository positionRepository) {
        this.positionRepository = positionRepository;
    }
    @Override
    public List<Position> getListPosition() throws SQLException {
        List<Position> positions = new ArrayList<>();
        PositionRepository positionRepository = new PositionRepository();
        positions = positionRepository.getListPosition();
        return positions;
    }

    @Override
    public void createPosition() throws SQLException {
        int result = positionRepository.createPosition();
        if (result > 0) {
            System.out.println("Them du lieu thanh cong");
        } else {
            System.out.println("Them du lieu that bai");
        }
    }

    @Override
    public void updatePosition() throws SQLException {
        int result = positionRepository.updatePosition();
        if (result>0) {
            System.out.println("Update success");
        } else {
            System.out.println("Update fails");
        }
    }
    @Override
    public void deletePosition() throws SQLException {
        int result = positionRepository.deletePosition();
        if (result>0) {
            System.out.println("Delete success");
        } else {
            System.out.println("Delete fails");
        }
    }
}
