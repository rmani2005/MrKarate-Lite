package karate.Trigger;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
import java.util.regex.Pattern;


public class Demo {

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//SCenario1:
		//I have recieve date dd/mm/yyyy
		
		Scanner in=new Scanner(System.in);
		for(int i=0;i<10;i++) {
				System.out.println("Enter Date in dd/mm/yyyy -");
				String date=in.nextLine();
					
				try {
					@SuppressWarnings("deprecation")
					Date d=new Date(date);
					//Pattern p=new Pattern();
					SimpleDateFormat sd=new SimpleDateFormat("dd/MM/yyyy");
					System.out.println(sd.format(d));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				}
		}
		
		
	}

}
