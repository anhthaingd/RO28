import controller.UserController;
import entity.User;
import repository.UserRepository;
import service.UserService;
import service.impl.UserServiceImpl;
import util.DatabaseUtils;

import java.sql.Connection;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        UserRepository repository = new UserRepository();
        UserService service = new UserServiceImpl(repository);
        UserController controller = new UserController(service);
        List<User> users =  controller.getListUserByProjectId();
        for (User user:users) {
            System.out.println(user);
        }
    }


}
