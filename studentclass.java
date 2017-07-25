import java.util.*;
class Student
{
  String name;
  int rollno;
  double phy,chem,math;
  
  void accept()
  {
    Scanner s= new Scanner(System.in);
    System.out.println("\n Enter name of the student \n");
    name=s.nextLine();
    System.out.println("\n Enter roll number of the student \n");
    rollno=s.nextInt();
    System.out.println("\n Enter Physics marks of the student \n");
    phy=s.nextDouble();
    System.out.println("\n Enter Chemistry marks of the student \n");
    chem=s.nextDouble(); 
    System.out.println("\n Enter Maths marks of the student \n");
    math=s.nextDouble();
  }
 
  void display()
  {
    System.out.println(" \n Name "+name);
    System.out.println(" \n Roll number "+rollno);
    System.out.println(" \n Physics Marks "+phy);
    System.out.println(" \n Chemistry Marks "+chem);
    System.out.println(" \n Maths Marks "+math);
  }
}

class StuPrint
{
   public static void main(String args[])
      {  int n,i;
         Scanner sc=new Scanner(System.in);
         Student s[] = new Student[10];
         System.out.println("Enter number of students \n");
         n= sc.nextInt();
         System.out.println("Enter details of each of the students \n");
         for(i=0;i<n;i++)
          {  System.out.println("\n Student"+(i+1));
              s[i]=new Student();
              s[i].accept();
          }
         System.out.println("Details of each student are \n");
         for(i=0;i<n;i++)
           {  System.out.println("Student"+(i+1));              
              s[i].display();
            }

       }
}