import java.io.*; //import library for input and output streams e.g. BufferedReader

public class LabAct2 {
    public static void main(String[] args) throws IOException{
        username();
        System.out.println("================================");
        email();
        System.out.println("================================");
        findPanda();
        System.out.println("================================");

    }
    
    public static void username()throws IOException, FileNotFoundException{
        /*create a method that will check if the username in the text file is valid
            A username is valid if:
            1. it starts and contains with a lowercase letter
                or digit or hyphen or underscore
            2. Minimum of 8 characters
            3. Maximum of 24 characters
        */
        File file = new File("C:\\Users\\CCPRGGL2Cruz\\Act2\\username.txt");
        BufferedReader br = new BufferedReader (new FileReader(file));
        String pattern = "(^[a-z])([a-z0-9-_]*){8,25}"; //insert regex here
        String text;
        
        while((text = br.readLine()) != null){
            System.out.println("Username: " + text);
            if(text.matches(pattern)){
                System.out.println("Valid.");
            }
            else{
                System.out.println("Not valid.");
            }
        } 
    }
    
    public static void email()throws IOException, FileNotFoundException{
        /*create a method that will check if the email in the text file is valid
            An email is valid if:
            1. it starts and contains with a word character
                or digit or hyphen or underscore (one or more)
            2. Followed by the "@" sign
            3. Followed by a word character
                or digit or hyphen or underscore (one or more)
            4. Followed by a "." then Ends with a word character or digit or hyphen
                or underscore (two or more)
            5. Characters before the "@" sign should be at least 7 characters
        */
        File file = new File("C:\\Users\\CCPRGGL2Cruz\\Act2\\email.txt");
        BufferedReader br = new BufferedReader (new FileReader(file));
        String pattern = "(^[\\w-_]{7,})@([\\w-_]+)\\.([\\w-_]{2,})$"; //insert regex here
        String text;
        
        while((text = br.readLine()) != null){
            System.out.println("Email: " + text);
            if(text.matches(pattern)){
                System.out.println("Valid.");
            }
            else{
                System.out.println("Invalid.");
            }
        } 
    }
    
    public static void findPanda()throws IOException, FileNotFoundException{
        /*create a method that will check if "panda" is in the string
        */
        File file = new File("C:\\Users\\CCPRGGL2Cruz\\Act2\\username.txt")\\panda.txt");
        BufferedReader br = new BufferedReader (new FileReader(file));
        String pattern = ".*panda*."; //insert regex here
        String text;
        
        while((text = br.readLine()) != null){
            System.out.println("Text: " + text);
            if(text.matches(pattern)){
                System.out.println("Panda found.");
            }
            else{
                System.out.println("panda not found.");
            }
        } 
    }
}
