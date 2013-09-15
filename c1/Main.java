import java.io.*;
import java.lang.*;
import java.util.*;

public class Main { 
	ArrayList<Integer> divisor1 = new ArrayList<Integer>();
	ArrayList<Integer> divisor2 = new ArrayList<Integer>();
	ArrayList<Integer> limit = new ArrayList<Integer>();

	private void getInput(String fileIn){
		try{
			BufferedReader in = new BufferedReader(new FileReader(fileIn));
			String line = null;
			String[] userin;
			while ((line = in.readLine()) != null) {
				userin = line.split(" ");
				divisor1.add(new Integer(userin[0]));
				divisor2.add(new Integer(userin[1]));
				limit.add(new Integer(userin[2]));
			}
		} catch (IOException e1){
			System.err.format("IOException: %s%n", e1);
		} catch (NumberFormatException e2){
			System.err.format("NumberFormatException: %s%n", e2);
		}
	}
	
	private void getOutput(){
		for (int i = 0; i < divisor1.size(); i++){
			for (int j = 1; j <= limit.get(i); j++){
				if (j%divisor1.get(i) == 0)
					System.out.print("F");
				if (j%divisor2.get(i) == 0)
						System.out.print("B");
				if ((j%divisor1.get(i) != 0) && (j%divisor2.get(i) !=0))
						System.out.print(j);
				System.out.print(" ");
			}
			System.out.println("");	
		}
	}

	public static void main (String[] args){
		Main game = new Main();
		game.getInput(args[0]);
		game.getOutput();
	}
}