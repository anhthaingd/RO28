package frontend;

import utils.FileManager;

import java.util.Scanner;

public class Program3 {
    public static void main(String args[]) throws Exception {
        // question1
        System.out.println("Question 1");
        String path = "C:\\Users\\pc\\Desktop\\Test.txt";
        System.out.println(FileManager.isFileExists(path));
        // question2
        System.out.println("Question 2");
        String path1 = "C:\\Users\\Admin\\OneDrive\\Desktop\\thai";
        String filename = "testoop.txt";
        FileManager.createNewFile(path1,filename);
        //question4
        System.out.println("Question 4");
        String path4 = "C:\\Users\\Admin\\OneDrive\\Desktop\\thai\\testoop.txt";
        FileManager.deleteFile(path4);
        //question5
        System.out.println("Question 5");
        FileManager.isFolderOrFile(path1);
        //question6
        System.out.println("Question 6");
        String[] list = FileManager.getAllFilenameOfFolder(path1);
        for (int i =0 ;i<list.length;i++) {
            System.out.println(list[i]);
        }
        //question7
        System.out.println("Question 7");
    }
}
