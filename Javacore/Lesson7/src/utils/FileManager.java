package utils;

import java.io.File;

public class FileManager {
    public static final String FILE_EXISTS = "File is exits!";
    public static final String FILE_NOT_EXISTS = "Error! File not exists";
    public static final String FOLDER_EXISTS = "Folder is exists";
    public static final String FOLDER_NOT_EXISTS = "Error! Folder not exists";

    public static boolean isFileExists(String pathFile) {
        File file =  new File(pathFile);
        if (file.exists()) return true;
        return false;
    }

    public static void createNewFile(String path,String filename) throws Exception {
        String pathFile = path + "//" + filename;
        File file = new File(pathFile);
        if (file.createNewFile()) {
            System.out.println("Create file successfully");
        } else {
            System.out.println("Create file fail");
        }
    }

    public static void deleteFile(String pathFile) throws Exception {
        if (!isFileExists(pathFile)) {
            throw new Exception(FILE_NOT_EXISTS);
        } else {
            boolean result = new File(pathFile).delete();
            System.out.println(result ? "Delete Successfully" : "Delete fail");
        }
    }
    public static void isFolderOrFile(String path) {
        File file = new File(path);
        if (file.isDirectory()) {
            System.out.println("This is folder");
        } else if (file.isFile()) {
            System.out.println("This is file");
        } else {
            System.out.println("Not folder or file");
        }
    }

    public static String[] getAllFilenameOfFolder(String path) {
        File file = new File(path);
        if (!file.isDirectory()) {
            System.out.println("Not exist directory");
            return null;
        } else {
            return file.list();
        }
    }

    public static void copyFile(String sourceFile,String destinationPath) throws Exception{
        if (!isFileExists(sourceFile)) {
            throw new Exception(FILE_NOT_EXISTS);
        }
        
    }
}
