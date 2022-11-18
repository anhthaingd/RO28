package controller;

import entity.User;
import service.UserService;

import java.util.ArrayList;
import java.util.List;

public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    public List<User> getListUserByProjectId() {
        List<User> users = new ArrayList<>();
        try {
            users=userService.getListUserByProjectId();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return users;
    }

}
