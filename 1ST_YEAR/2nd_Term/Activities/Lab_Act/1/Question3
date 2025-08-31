import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Question3 {
    public static void main(String[]args) throws IOException{

    // Initialize the count from 0
    int vowelCount = 0;

    // Locate and open the file dummy.txt
    try (BufferedReader br = new BufferedReader(new FileReader("E:\\Programming\\Code1\\Code1\\src\\dummy.txt"))) {

        // Initialize the count from 0 to 5 in reading the line from the file
        for (int i = 0; i < 5; i++) {
            String text = br.readLine();

            // If the line reaches the line 5 it will stop reading the next lines.
            if (text == null) {
                
                break;
            }

            // Counts the vowels in each line
            vowelCount += countVowels(text);
        }
    }
        System.out.println("Number of vowels in the first 5 lines: " + vowelCount);
    }
    
    public static int countVowels(String s) {

      // Initialize the vowel count to 0
      int count = 0;
      // Loop through each character in the string
      for (int i = 0; i < s.length(); i++) {
        char c = s.charAt(i);
        // If the character is a vowel it will increment the vowel count
        if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U') {
          count++;
        }
      }
      return count;
    }
    }
    
