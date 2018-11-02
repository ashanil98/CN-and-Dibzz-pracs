import java.net.*;
import java.io.*;
 

public class  udpClient
{
	public static void main(String args[]) throws Exception
	{
		Socket sk=new Socket("localhost",5000);
		//BufferedReader sin=new BufferedReader(new InputStreamReader(sk.getInputStream()));
		PrintStream sout=new PrintStream(sk.getOutputStream());
		BufferedReader stdin=new BufferedReader(new InputStreamReader(System.in));
		String s;
		while (  true )
		{
			System.out.print("Client : ");
            s=stdin.readLine();
            sout.println(s);
            if (s == "END") 
                break;
			//s=sin.readLine();
			//System.out.print("Server : "+s+"\n");
  			//if ( s.equalsIgnoreCase("BYE") )
 			//   break;
		}
		 sk.close();
		 //sin.close();
		 sout.close();
 		stdin.close();
	}
}

