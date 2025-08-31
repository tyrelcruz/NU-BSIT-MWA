import java.io.*;
import java.util.Scanner;

public class Question4 {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    System.out.print("Enter the file name: ");
    String fileName = scanner.nextLine();

    try {
      File file = new File(fileName);
      Scanner fileScanner = new Scanner(file);
      int wordCount = 0;

      while (fileScanner.hasNext()) {
        String word = fileScanner.next();
        wordCount++;
      }

      System.out.println("Number of words: " + wordCount);
      fileScanner.close();
    } catch (FileNotFoundException e) {
      System.out.println("File not found.");
    }
  }
}
