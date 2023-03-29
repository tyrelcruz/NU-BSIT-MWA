import java.io.*;

public class FileWriteFW {
    public static void main(String[] args) throws IOException, FileNotFoundException{
        File outFile = new File("output.txt");
        System.out.println("File path: "+outFile.getAbsolutePath());
        FileWriter fw = new FileWriter(outFile, true);
        try{
            fw.write("\nThis is the second line");
        }
        catch(Exception e){
            System.out.println("Error has occured when writing file: "+e.getMessage());
        }
        finally{
            //flush everything buffer after printing
            fw.flush();
            //flush and close are used to save the file
            fw.close();
        }
    }
}
