import java.lang.*;
import java.io.*;

public class Main{
	
	private static boolean isPrime(int n){
		int k = 2;
		while (k < (n/2)+1){
			if (n%k == 0)
				return false;
			k++;
		}
		return true;
	}
	
	private static boolean isPalindrome(int m) {
		String temp = Integer.toString(m);
		for (int j = 0; j < temp.length()/2; j++){
			if (temp.charAt(j)!= temp.charAt(temp.length()-1-j))
				return false;
		}
		return true;
	}

	public static void main(String[] args){
		for (int i = 999; i > 9; i--){
			if (isPalindrome(i)){
				if (isPrime(i)){
					System.out.println(i);
					System.exit(0);
				}
			}
		}
	}
}