import java.io.*;
import java.lang.*;

public class Main {
	
	public static void main(String[] args){
		try{
			BufferedReader in = new BufferedReader(new FileReader(args[0]));
			String line = null;
			String[] userin;
			while ((line = in.readLine()) != null) {
				userin = line.split(" ");
				int j = Integer.parseInt(userin[userin.length-1]);
				if (userin.length-1 < j)
					continue;
				else {
					System.out.println(userin[userin.length-1-j]);
				}
			}
		} catch (IOException e1){
			System.err.format("IOException: %s%n", e1);
		} catch (NumberFormatException e2){
			System.err.format("NumberFormatException: %s%n", e2);
		}
	} //end main
	
} //end Main