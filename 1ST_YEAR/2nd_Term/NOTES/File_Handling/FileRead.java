import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class FileRead {
    public static void main(String[] args) throws FileNotFoundException {
        File inputFile = new File("C:\\Users\\cruztp\\Documents\\NetBeansProjects\\Cruz_Programming\\input.txt");
        Scanner inFile = new Scanner(inputFile);
        
        try{
            while(inFile.hasNextLine()){
            System.out.print(inFile.nextLine());
            }
            System.out.println("");
        }
        catch(Exception e){
            System.out.println("An error has occured: "+e.getMessage());
        }
        finally{
            inFile.close();
        }
    }
}
