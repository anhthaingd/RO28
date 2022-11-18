package service.impl;

import entity.User;
import repository.UserRepository;
import service.UserService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {
    public final UserRepository userRepository;
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    @Override
    public List<User> getListUserByProjectId() throws SQLException {
        List<User> users = new ArrayList<>();
        UserRepository userRepository = new UserRepository();
        users =userRepository.getListUserByProjectId();
        return users;
    }
}
