package service;

import entity.User;

import java.sql.SQLException;
import java.util.List;

public interface UserService {
    List<User> getListUserByProjectId() throws SQLException;
}
