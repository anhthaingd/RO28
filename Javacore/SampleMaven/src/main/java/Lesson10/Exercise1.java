package Lesson10;

import controller.PositionController;
import entity.Position;
import repository.PositionRepository;
import service.PositionService;
import service.impl.PositionServiceImpl;
import utils.DatabaseUtils;

import java.sql.Connection;
import java.util.List;
import java.util.Scanner;

public class Exercise1 {
    private final Connection con = DatabaseUtils.getInstance().getDatabaseConnection();
    PositionRepository repository = new PositionRepository();
    PositionService service = new PositionServiceImpl(repository);
    PositionController controller = new PositionController(service);
    public void question1() {
        while (true) {
            menu();
            Scanner sc = new Scanner(System.in);
            int choose = sc.nextInt();
            switch (choose) {
                case 1:
                    if (con!=null) {
                        System.out.println("Ket noi thanh cong");
                    } else {
                        System.out.println("Ket noi that bai");
                    }
                    break;
                case 2:
                    List<Position> positions = controller.getListPosition();
                    for(Position position:positions) {
                        System.out.println(position);
                    }
                    break;
                case 3:
                    controller.createPosition();
                    break;
                case 5:
                    controller.deletePosition();
                    break;
                case 6:
                    return;

            }
        }
    }

    public static void menu() {
        System.out.println("1. Ket noi co so du lieu");
        System.out.println("2. In danh sach position");
        System.out.println("3. Tao position");
        System.out.println("4. Update position");
        System.out.println("5. Delete position by id");
        System.out.println("6. Thoat");
        System.out.println("Chon chuc nang");
    }
}
