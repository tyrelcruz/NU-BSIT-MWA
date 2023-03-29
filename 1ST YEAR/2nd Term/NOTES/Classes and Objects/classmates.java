import java.util.Scanner;

//Classmate Details

class classmate {
  private String name; //Attributes
  private int age; // Attributes
  private String course; // Attributes
  
  public classmate() {
    Scanner scan = new Scanner(System.in);
    System.out.print("Enter name: ");
    this.name = scan.nextLine();
    System.out.print("Enter age: ");
    this.age = scan.nextInt();
    scan.nextLine();
    System.out.print("Enter course: ");
    this.course = scan.nextLine();
  }
  
  //Behaviors or method
  public void displayclassmateDetails() {
    System.out.println("This are the details of your classmates");
    System.out.println("Name: " + this.name);
    System.out.println("Age: " + this.age);
    System.out.println("Course: " + this.course);
  }
  
  //Behaviors or method
  public String getName() {
    return this.name;
  }
  
  //Behaviors or method
  public int getAge() {
    return this.age;
  }
  
  //Behaviors or method
  public String getCourse() {
    return this.course;
  }
}
