import java.io.*;

public class Question1 {
    public static void main(String[] args) throws IOException, FileNotFoundException{

        int sum = 0;

        // used BufferedReader to locate the file
        try (BufferedReader data = new BufferedReader(new FileReader("E:\\Programming\\Code1\\Code1\\src\\data.txt"))) {
            String text;
            // read each line of the file
            while ((text = data.readLine()) != null) {

                // convert string/lines to integer
                System.out.println("The file contains: " + text);
                sum += Integer.parseInt(text);

            }
        } catch (IOException e) {
            // print error message if there's a problem reading the file
            System.out.println("Error reading file: " + e.getMessage());
        }
 

        // File writer - Create a file with the sum of data.txt
        try (PrintWriter pw = new PrintWriter(new FileWriter("sum.txt"))) {
            // write the sum to the file
            pw.println("The sum of input file from data.txt is: " + sum);
            System.out.println("The file Sum has been successfully created");
            
        } catch (IOException e) {
            // print error message if there's a problem writing the file
            System.out.println("Error writing to file: " + e.getMessage());
        }
    }
}
