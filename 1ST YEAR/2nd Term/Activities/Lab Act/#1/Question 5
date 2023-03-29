import java.io.*;
import java.util.*;

public class Question5 {
  public static void main(String[] args) throws IOException, FileNotFoundException {
    // Prompt the user for the input and output file names
    Scanner scan = new Scanner(System.in);
    System.out.print("Enter the input file name: ");
    String inputFileName = scan.nextLine();
    System.out.print("Enter the output file name: ");
    String outputFileName = scan.nextLine();

    // Open the input file
    File inputFile = new File(inputFileName);
    Scanner input = new Scanner(inputFile);

    // Create the output file
    FileWriter outputFile = new FileWriter(outputFileName);
    PrintWriter output = new PrintWriter(outputFile);

    // Read each line of the input file, reverse the words, and write to the output file
    while (input.hasNextLine()) {
      String line = input.nextLine();
      String[] words = line.split(" ");
      for (int i = words.length - 1; i >= 0; i--) {
        output.print(words[i] + " ");
      }
      output.println();
    }

    // Close the input and output files
    input.close();
    output.close();
  }
}
