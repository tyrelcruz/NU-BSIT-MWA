import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Question2 {
  public static void main(String[] args) throws IOException, FileNotFoundException{

    // Locate the file dummy.txt
    try (BufferedReader br = new BufferedReader(new FileReader("E:\\Programming\\Code1\\Code1\\src\\dummy.txt"))) {
      String text;

    // Reads line from 0
    int lineCount = 0;

      // read file from 0 to 5
      while ((text = br.readLine()) != null && lineCount < 5) {
        System.out.println(text);

        // increment line count
        lineCount++;

        //Close the file
        br.close();

      }
    } 
  }
}
